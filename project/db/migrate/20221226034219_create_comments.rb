class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string      :contributor, null: false, index: true
      t.text        :comment, null: false
      t.integer     :post_id, null: false, index: true
      t.integer     :user_id, index: true
      t.datetime    :deleted_at

      t.timestamps
    end
  end
end
