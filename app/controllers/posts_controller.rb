class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @categories = Category.all

    cate = params[:cate]
    puts 'params', params
    puts 'cate', cate

    if !cate.nil?
      @posts = Post.where(:category_id => cate)
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    # puts 'id = ' + params[:id]
  end

  def update

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

  end

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
