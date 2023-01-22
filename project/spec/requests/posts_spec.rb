# require 'rails_helper'

# RSpec.describe "Posts", type: :request do
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

require 'rails_helper'

RSpec.describe "Posts" do
  describe 'index' do
    example 'index アクションで正常なレスポンスが返ってくる' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    before do
      @post = Post.create!(title: 'スレッドタイトル', comments_attributes: [{ comment: '内容', contributor: 'ななしくん' }])
    end

    example 'show アクションで正常なレスポンスが返ってくる' do
      get post_path(@post)
      expect(response).to have_http_status(:ok)
    end
  end
end
