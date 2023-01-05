class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)

    redirect_to controller: :posts, action: :show, id: @comment.post_id
  end

  private

  def comment_params
    params.require(:comment).permit(:contributor, :comment, :post_id)
  end
end
