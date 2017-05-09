class ChangeDateDataType < ActiveRecord::Migration[5.1]
  def change
    remove_column(:purchases, :date, :timestamp)
    add_column(:purchases, :date, :date)
  end
end
