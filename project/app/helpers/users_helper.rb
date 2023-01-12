module UsersHelper
    # ユーザーIDをセットしてセッション開始(サインイン)
    def user_session_start(user)
      session[:user_id] = user.id
    end
   
    # セッション中のユーザーインスタンスを取得
    def user_in_session
      # 初めて取得する場合、インスタンス変数に保存
      if @user_in_session.nil?
        @user_in_session = User.find_by(id: session[:user_id])
      # 既に取得済みなら、インスタンス変数で返す
      else
        @user_in_session
      end
    end
   
    # セッション終了(サインアウト)
    def user_session_end
      session.delete(:user_id)
      @user_in_session = nil
    end
  end
