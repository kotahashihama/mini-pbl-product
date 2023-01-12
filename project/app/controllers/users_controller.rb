class UsersController < ApplicationController

    def edit
        @user = User.find(user_in_session.id)
    end

    def update
        #update処理
        @user = User.find(user_in_session.id)
        if @user.update(user_params)
            redirect_to profile_path(user_in_session)
        else
            flash.now[:danger] = "設定更新できませんでした"
            flash.now :edit_user, layout: 'application' and return
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def sign_up
        @user = User.new
        render layout: 'application_signed_out'
    end

    def sign_in
        render layout: 'application_signed_out'
    end

    def sign_out
        user_session_end
        redirect_to :sign_in and return
    end

    def sign_in_process
        @user = User.new(user_params)
        encrypted_password = user_params[:password]
        # encrypted_password = User.generate_digest(user_params[:password])
        user = User.find_by(email: user_params[:email], password: encrypted_password)
        if user
            user_session_start(user)
            redirect_to top_path and return
        else
          flash.now[:danger] = "サインインできません"
          render :sign_in, layout: 'application_signed_out' and return
        end
    end


    def sign_up_process
        @user = User.new(user_params)

        puts params[:name]
        puts params[:email]
        puts params[:password]

        if @user.save
            user_session_start(@user)
            flash.now[:success] = "ユーザー登録しました"
            render :sign_in, layout: 'application_signed_out'
        else
            flash.now[:danger] = @user.errors.messages.values.flatten.join("<br>")
            render :sign_up, layout: 'application_signed_out'
        end
    end

    private
    def user_params
        params.permit(:name, :email, :password)
    end
end
