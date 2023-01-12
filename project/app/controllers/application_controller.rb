class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # ユーザーセッションの管理に関するメソッドモジュールをインクルード
    include UsersHelper
end
