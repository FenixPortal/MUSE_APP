#-*-coding:utf-8-*-
class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    # binding.pry
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to @posts
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :link, :description, :user_id, :image)
    end
end
