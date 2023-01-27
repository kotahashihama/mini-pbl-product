class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def mypage
    @comments = Comment.where(user_id: current_user.id).order(created_at: :desc)
  end
end
