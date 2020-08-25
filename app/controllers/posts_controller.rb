class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
