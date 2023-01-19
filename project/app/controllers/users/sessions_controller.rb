# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    def new
      #super
    end

    # POST /resource/sign_in
    def create
      #super
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password_digest])
        # ユーザーログイン後にユーザー情報のページにリダイレクトする
        log_in user
        redirect_to user
      else
        # エラーメッセージを作成する
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    # DELETE /resource/sign_out
    def destroy
      #super
    end

    def respond_to_on_destroy
      respond_to do |format|
        format.all { head :no_content }
        format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: :see_other }
      end
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
