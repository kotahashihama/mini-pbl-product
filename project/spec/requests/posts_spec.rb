require 'rails_helper'

RSpec.describe "Posts" do
  describe 'index' do
    example 'スレッド一覧ページを表示できる' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    before do
      @post = Post.create!(title: 'スレッドタイトル', comments_attributes: [{ comment: 'はろー', contributor: 'ななしくん' }])
    end

    example 'スレッド詳細ページを表示できる' do
      get post_path(@post)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    example 'スレッドを作成できる' do
      post_params = { post: { title: 'スレッドタイトル', comments_attributes: { '0' => { comment: 'はろー', contributor: 'ななしくん' } } } }
      post posts_path, params: post_params
      expect(response).to have_http_status(:found)
    end
  end
end
