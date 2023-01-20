class AddSerialIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :serial_id, :integer, null: false, default: 0, after: :id
  end
end
