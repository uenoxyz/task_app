class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post_count = Post.all.count
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def post_params
    params.permit(:title, :start_day, :end_day, :memo)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to(posts_path)
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "スケジュールを編集しました"
      redirect_to(posts_path)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to(posts_path)
  end
end
