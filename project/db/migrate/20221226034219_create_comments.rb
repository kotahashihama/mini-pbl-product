class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer    :post_id, null: false, index: true
      t.integer    :user_id, null: false, index: true
      t.string     :comment, null: false
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
