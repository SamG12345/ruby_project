class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

  # this the index or home page that gets all the post and display it
  def index
    @posts = Post.select("id, title, SUBSTRING(body, 1, 0.2*LENGTH(body)) as body")
  end

  # This Function shows a particualr Post of a paticula id
  def show
    #@post = Post.find(params[:id]) # using before_action to implement DRY
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

  # Private function to check params. Used in function create, update
  private
  def post_params
    params.expects(post: [:title, :body])
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
