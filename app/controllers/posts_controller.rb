class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:category).all
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "L'article a bien été modifié"
    else
      render :edit
      end
    end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "L'article a bien été créé"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "L'article a bien été supprimé"
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :category_id)
  end
end
