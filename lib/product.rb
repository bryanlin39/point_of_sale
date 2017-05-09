class Product < ActiveRecord::Base

  def self.checkout(id_array)
    product_array = []
    id_array.each() do |id|
      product = Product.find(id.to_i())
      product_array.push(product)
    end
    product_array
  end

  def self.purchases(products_array)
    product_prices = []
    products_array.each() do |product|
      product_prices.push(product.price())
    end
    total_price = product_prices.inject(0, :+)
  end

  def self.delete_purchased(id_array)
    product_array = []
    id_array.each() do |id|
      product = Product.find(id.to_i())
      product.delete()
    end
  end


  validates(:description, :presence => true)
  validates(:price, :numericality => { :greater_than => 0})

end
