class PostsController < ApplicationController
  def show
    @comments = Comment.all
    @comment = Comment.new
  end
end

