class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]
  
  def index
    @users = User.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page], :per_page => 30)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page], :per_page => 30)
    render 'show_follow'
  end

  private
    def set_user
      @user = User.find(params[:id])

      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the post_path, and we should do
      # a 301 redirect that uses the current friendly id.
      if request.path != user_path(@user)
        return redirect_to @user, :status => :moved_permanently
      end
    end

end
