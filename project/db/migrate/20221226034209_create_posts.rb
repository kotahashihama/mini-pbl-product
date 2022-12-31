class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string      :title, null: false, index: true
      t.text        :detail, null: false
      t.datetime    :deleted_at

      t.timestamps
    end
  end
end
