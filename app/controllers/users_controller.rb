class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all - [ current_user ]
  end

  def show
    @users = Users.find(params[:id])
  end

end
