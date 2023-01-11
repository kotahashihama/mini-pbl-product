class PostsController < ApplicationController
  def index
    # スレッド一覧取得メソッド
    Rails.logger.debug "index method called"
    @posts = Post.all
    @post = Post.new
  end

  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    Rails.logger.debug "create method called"
    @post = Post.create(post_params)

    redirect_to controller: :posts, action: :index
  end

  def post_params
    params.require(:post).permit(:title, :detail)
  end
end
