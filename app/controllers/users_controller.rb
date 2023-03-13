class UsersController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by[id: session[:user_id]]
    end
    @users = User.all
  end
end
