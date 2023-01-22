require 'rails_helper'

RSpec.describe "Comments" do
  describe 'create' do
    example 'コメントを作成できる' do
      post_params = { comment: { contributor: 'ななしくん', comment: 'はろー', post_id: 1 } }
      post comments_path, params: post_params
      expect(response).to have_http_status(:found)
    end
  end
end
