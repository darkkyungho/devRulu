class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show, :tags]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    @posts = @posts.tagged_with(params[:tag]) if params[:tag]

    @posts = @posts.paginate(page: params[:page], :per_page => 30)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post

    @comments = @commentable.comments
    @comment = @comments.new if user_signed_in?
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # GET /posts/tags
  def tags
    @tags = Post.tag_counts

    @tags = @tags.where('name LIKE ?', "%#{params[:q]}%") if params[:q]
    @tags = @tags.limit(10)

    respond_to do |format|
      format.json { render json: @tags}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :title, :image, :tag_list)
    end
end
