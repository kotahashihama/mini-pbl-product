class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string     :login_id, null: false, unique: true, index: true
      t.string     :password, null: false
      t.string     :name, null: false
      t.string     :email, null: false
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
