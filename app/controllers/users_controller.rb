class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def update
  current_user.update(firstname: params[:user][:firstname], lastname: params[:user][:lastname], avatars: params[:user][:avatars])
  	if current_user.save
  		redirect_to user_path(current_user)
  	end
  end
end