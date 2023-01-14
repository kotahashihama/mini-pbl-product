class PostsController < ApplicationController

  def index
    # スレッド一覧取得メソッド
    @posts = Post.all
    @post = Post.new
    # 下記記載がないと、.erbファイルでfields_forを使用したときに要素自体が表示されない
    @post.comments.build
  end

  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    Post.create!(post_params)
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, comments_attributes: [:comment, :contributor])
      # params.require(:post).permit(:title, :comment, :contributor)
    end

end
