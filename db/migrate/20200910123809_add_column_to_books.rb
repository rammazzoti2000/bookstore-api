class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :user_id, :int, null: false
  end
end
