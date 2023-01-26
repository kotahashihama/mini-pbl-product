require 'rails_helper'

RSpec.describe "Posts" do
  describe 'index' do
    example 'スレッド一覧ページを表示できる' do
      get '/'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    example 'スレッド詳細ページを表示できる' do
      post = Post.create!(title: 'スレッドタイトル', comments_attributes: [{ comment: 'はろー', contributor: 'ななしくん' }])
      get post_path(post)

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

  describe '#add_anchor_link_for_index' do
    before do
      post = Post.create!(title: 'スレッドタイトル', comments_attributes: [{ comment: '>>1 です。よろしく', contributor: 'ななしくん' }])
      post.comments.create!(comment: '>>1 おっす', contributor: 'のねむちゃん')
      post.comments.create!(comment: '>>2 ういす', contributor: '')
      post.comments.create!(comment: '>>3 よー', contributor: 'てすとせんぱい')
      post.comments.create!(comment: '>>4 よっ', contributor: 'あーるすぺっく')
    end

    context 'メンション対象のコメントがスレッド抜粋一覧に表示されている場合' do
      example 'スレッド抜粋一覧上でのページ内リンクを付与できる' do
        posts_controller = PostsController.new
        posts = posts_controller.send(:add_anchor_link_for_index, Post.all)

        expect(posts[0].comments[3].comment).to eq "<a href='#post-1-comment-3'>>>3</a> よー"
      end
    end

    context 'メンション対象のコメントがスレッド抜粋一覧に表示されていない場合' do
      example 'スレッド詳細ページでのページ内リンクを付与できる' do
        posts_controller = PostsController.new
        posts = posts_controller.send(:add_anchor_link_for_index, Post.all)

        expect(posts[0].comments[2].comment).to eq "<a href='/posts/1#comment-2'>>>2</a> ういす"
      end
    end
  end

  describe '#add_anchor_link_for_show' do
    example 'メンションのテキストにページ内リンクを付与できる' do
      posts_controller = PostsController.new
      post = Post.create!(title: 'スレッドタイトル', comments_attributes: [{ comment: '>>1 です。よろしく', contributor: 'ななしくん' }])
      comments = posts_controller.send(:add_anchor_link_for_show, Comment.where(post_id: post.id))

      expect(comments[0].comment).to eq "<a href='#comment-1'>>>1</a> です。よろしく"
    end
  end
end
