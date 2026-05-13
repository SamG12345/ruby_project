class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

  # this the index or home page that gets all the post and display it
  def index
    @posts = Post.select("id, title, SUBSTRING(body, 1, 0.2*LENGTH(body)) as body")
  end

  # This Function shows a particualr Post of a paticula id
  def show
    #@post = Post.find(params[:id]) # using before_action to implement DRY
    @comments = Comment.where(post_id: params[:id]).all
  end

  # This Function shows new Post
  def new
    @post = Post.new
  end

  # This function created new Post
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  # This function edits the post
  def edit
    #@post = Post.find(params[:id]) # using before_action to implement DRY
  end

  # This function updates the post
  def update
    #@post = Post.find(params[:id]) # using before_action to implement DRY
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # This function deletes the post
  def destroy
    #@post = Post.find(params[:id]) # using before_action to implement DRY
    if @post.destroy
      redirect_to posts_path
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  # Function to add comment
  def comment
    @post = Post.find(params[:post_id])
    @parm = params.require(:comment).permit(:body)
    if @post.comments.create!(@parm)
      redirect_to @post
    else
      render :comment, status: :unprocessable_entity
    end
  end

  def comment_show
    #@comment = Comment.where(id: params[:id], post_id: params[:post_id])
    @comment = Comment.find(params[:post_id])
  end

  # Function to add Reply
  def reply
    puts params
  end

  # Private function to check params. Used in function create, update
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
