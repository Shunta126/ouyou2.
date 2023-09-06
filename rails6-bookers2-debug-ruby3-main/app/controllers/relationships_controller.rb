class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def follows
   user = User.find(params[:id])
   @users = user.following_users
  end


  def followers
   user = User.find(params[:id])
   @user = user.follower_users
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

end
