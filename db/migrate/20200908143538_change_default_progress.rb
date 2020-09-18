class ChangeDefaultProgress < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:books, :progress, 1)
  end
end
