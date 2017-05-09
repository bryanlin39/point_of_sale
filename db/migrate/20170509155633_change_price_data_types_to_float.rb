class ChangePriceDataTypesToFloat < ActiveRecord::Migration[5.1]
  def change
    remove_column(:products, :price, :integer)
    add_column(:products, :price, :float)
    remove_column(:purchases, :totalcost, :integer)
    add_column(:purchases, :totalcost, :float)
  end
end
