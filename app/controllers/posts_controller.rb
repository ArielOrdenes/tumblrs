class PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(params[:post].permit(:title, :body))
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.required(:post).permit(:title, :body)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
