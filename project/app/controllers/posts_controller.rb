class PostsController < ApplicationController
  def index
    Rails.logger.debug "index now"
    # スレッド一覧取得メソッド
    @posts = add_anchor_link_for_index(Post.all)
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
    @comments = add_anchor_link_for_show(Comment.where(post_id: params[:id]))
    @comment = Comment.new
    @post_title = Post.find(params[:id]).title
    @users = User.all
  end

  def create
    processed_post_params = post_params
    processed_post_params[:comments_attributes]['0'][:serial_id] = 1
    Post.create!(processed_post_params)
    redirect_to root_path
  end

  private

  def add_anchor_link_for_index(posts)
    posts.each do |post|
      post.comments.each do |comment|
        comment.comment = comment.comment.gsub(/>>\d+/) do |match|
          serial_id = match.gsub('>>', '').to_i
          is_in_excerpt_range = serial_id == 1 || serial_id > post.comments.count - 3

          if is_in_excerpt_range
            "<a href='#post-#{post.id}-comment-#{serial_id}'>#{match}</a>"
          else
            "<a href='/posts/#{post.id}#comment-#{serial_id}'>#{match}</a>"
          end
        end
      end
    end
  end

  def add_anchor_link_for_show(comments)
    comments.each do |comment|
      comment.comment = comment.comment.gsub(/>>\d+/) do |match|
        serial_id = match.gsub('>>', '')
        "<a href='#comment-#{serial_id}'>#{match}</a>"
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, comments_attributes: [:comment, :contributor])
  end
end
