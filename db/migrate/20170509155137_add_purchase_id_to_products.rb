class AddPurchaseIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column(:products, :purchase_id, :integer)
  end
end
