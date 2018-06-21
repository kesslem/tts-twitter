class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all - [ current_user ]
  end

  def show
    @user = User.find(params[:id])
    @message = Message.new

    if current_user == @user
      following_ids = current_user.following
      following_ids << current_user.id
      @messages = Message.where(user_id: current_user.following)
    else
      @messages = @user.messages
    end
  end

end
