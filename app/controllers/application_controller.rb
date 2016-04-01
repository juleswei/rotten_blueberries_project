class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def restrict_access

    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_admin
    unless current_user.admin?
      flash[:alert] = "You must be an admin to log in."
      redirect_to root_path
    end
  end

end
  #same method as require_admin
  # def admin_restrict_access
    
  #   if !current_user
  #     flash[:alert] = "You must be an admin to log in."
  #     redirect_to root_path
  #   end
  # end
