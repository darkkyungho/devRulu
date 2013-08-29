class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], :per_page => 30)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], :per_page => 30)
    render 'show_follow'
  end

end
