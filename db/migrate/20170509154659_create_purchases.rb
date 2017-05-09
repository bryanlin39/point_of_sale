class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table(:purchases) do |t|
      t.column(:name, :string)
      t.column(:date, :timestamp)
      t.column(:totalcost, :integer)
    end
  end
end
