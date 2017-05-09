require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/product')
require('./lib/purchase')
require('pg')
require('pry')

get('/') do
  @products = Product.all()
  erb(:index)
end

get('/products/new') do
  erb(:add_products)
end

post('/add_products') do
  description = params[:description]
  price = params[:price]
  Product.create({:description => description, :price => price})
  @products = Product.all()
  erb(:index)
end

post('/checkout') do
  product_ids = params[:product]
  @products = Product.checkout(product_ids)
  customer_name = params[:name]
  @purchase = Purchase.create({:name => customer_name, :date => Time.now(), :totalcost => Product.purchases(@products)})
  erb(:checkout)
end

delete('/products/updated') do
  purchased_products = params[:purchased_products]
  Product.delete_purchased(purchased_products)
  @products = Product.all()
  erb(:index)
end

get('/edit_product/:id') do
  @product = Product.find(params[:id].to_i())
  erb(:edit_product)
end

patch('/edit_product/:id') do
  description = params[:description]
  price = params[:price].to_i()
  @product = Product.find(params[:id].to_i())
  if @product.update({:description => description, :price => price})
    @products = Product.all()
    erb(:index)
  else
    erb(:errors)
  end
end

get('/search') do
  erb(:search)
end

post('/search_results') do
  start_date = params[:start_date]
  end_date = params[:end_date]
  @search_purchases = Purchase.purchase_date(start_date, end_date)
binding.pry
  erb(:search_results)
end

# get('/errors/:id') do
#   @product = Product.find(params[:id].to_i())
#   erb(:errors)
# end
