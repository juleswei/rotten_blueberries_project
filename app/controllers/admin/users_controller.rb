class Admin::UsersController < ApplicationController
  before_action :require_admin

  # layout 'admin'

  # def index
  #   @users = User.all
  # end

end