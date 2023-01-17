class PostsController < ApplicationController
  def index
    Rails.logger.debug "index now" 
    # スレッド一覧取得メソッド
    @posts = Post.all
    Rails.logger.debug @posts 
    @post = Post.new
    # 下記記載がないと、.erbファイルでfields_forを使用したときに要素自体が表示されない
    @post.comments.build
    # 追加分
    @comments = Comment.all
    @comment = Comment.new


  end

  def show
    # show.html.erbに遷移するとこのメソッドを読みに来るので、対象post_idに紐づくcomment一覧を返す
    @comments = Comment.where(post_id: params[:id])
    @comment = Comment.new
  end

  def create
    Post.create!(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, comments_attributes: [:comment, :contributor])
  end
end

