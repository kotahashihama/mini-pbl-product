class DeleteDetailFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :detail, :text
  end
end
