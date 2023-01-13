class PostsController < ApplicationController

  # def new
  #   @post = Post.new
  #   @post.comments.build
  # end

  def index
    # スレッド一覧取得メソッド
    @posts = Post.all
    @post = Post.new
  end

  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    # logger.debug("createに入った")
    # logger.debug(post_params)
    Post.create(post_params)
    # @comment = Comment.new

    redirect_to controller: :posts, action: :index
  end

  private

    def post_params
      params.require(:post).permit(:title, comment_attributes: [:comment, :contributor])
      # params.require(:post).permit(:title, :comment, :contributor)
    end

end
