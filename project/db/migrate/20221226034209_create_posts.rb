class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer    :user_id, null: false, index: true
      t.string     :title, null: false
      t.string     :detail, null: false
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
