class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table(:products) do |t|
      t.column(:description, :string)
      t.column(:price, :integer)
    end
  end
end
