class UsersController < ApplicationController
  def show
  	#@user = User.find(params[:id])
  	@user = User.find_by(username: params[:username])
    @tweets = @user.tweets
  end
end
