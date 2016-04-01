class Admin::UsersController < ApplicationController
  
  before_action :require_admin

  # layout 'admin'
  def index
    @users = User.page(params[:page]).per(10)
  end

  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
    # redirect_to admin_users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to admin_users_path, notice: "#{@user.firstname} successfully added"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to 'admin/users'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    UserMailer.destroy_email(@user).deliver

    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end
end