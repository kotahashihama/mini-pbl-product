class PostsController < ApplicationController
  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  # 編集中
  def index
    @posts = Post.all
    @post = Post.new

    @comments = Comment.all
    @comment = Comment.new
    @comments_first = Comment.first
    @comments_last = Comment.last(3)
    
  end
end

