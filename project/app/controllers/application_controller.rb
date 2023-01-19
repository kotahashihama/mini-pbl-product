class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    include SessionsHelper
  
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:birthday])
        devise_parameter_sanitizer.permit(:account_update, keys: [:occupation])
    end

    # 新規登録後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
        if current_user
          flash[:notice] = "ログインに成功しました" 
          root_url  #　指定したいパスに変更
        else
          flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
          mypage_path  #　指定したいパスに変更
        end
    end

    def after_sign_out_path_for(resource)
        user_registrations_path
    end
end
