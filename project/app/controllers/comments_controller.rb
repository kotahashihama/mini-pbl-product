class CommentsController < ApplicationController
  def create
    serial_id = Comment.where(post_id: params[:comment][:post_id]).count + 1
    processed_comment_params = comment_params
    processed_comment_params['serial_id'] = serial_id

    # ユーザーのなりすましを防止
    processed_comment_params['contributor'] = processed_comment_params['contributor'].tr('◆', '◇')

    @comment = Comment.create(processed_comment_params)

    redirect_to controller: :posts, action: :show, id: @comment.post_id
  end

  private

  def comment_params
    params.require(:comment).permit(:contributor, :comment, :post_id, :user_id)
  end
end
