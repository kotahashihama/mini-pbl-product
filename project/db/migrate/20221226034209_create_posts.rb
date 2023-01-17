class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string      :title, null: false, index: true
      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
