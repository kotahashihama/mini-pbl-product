require 'rails_helper'

RSpec.describe "Users" do
  describe 'should get show' do
    context 'sign_in' do
      example 'マイページとログアウトボタンを表示できる' do
        get users_show_url
        expect(assert_response).to eq(:success)
      end
      it { should get show }
    end

    context 'sign_out' do
      example '新規登録ボタンとログインボタンを表示できる' do
        get "/"
        expect(assert_response).to eq(:success)
      end

      it { should get show } do
        login(user)
        expect(page).to have_content 'Login successful'
        expect(current_path).to eq root_path

    end


  end

end
