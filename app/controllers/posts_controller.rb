class PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end
  def show

  end
  def new
    @post= Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end
  def edit

  end
  def update

  end
  def destroy

  end

  private

  def post_params
    params.required(:post).permit(:title, :body)
  end
  def post_find
    @post = Post.find(params[:id])
  end

end
