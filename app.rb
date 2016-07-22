require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

post('/stores') do
  name = params.fetch('store_name')
  store = Store.new({:name => name})
  @store = store
  @stores = Store.all
  if store.save
    redirect('/stores')
  else
    erb(:store_errors)
  end
end

post('/brands') do
  name = params.fetch('brand_name')
  brand = Brand.new({:name => name})
  @brand = brand
  @brands = Brand.all
  if brand.save
    redirect('/brands')
  else
    erb(:brand_errors)
  end
end

get('/stores/:id') do

end

get('/brands/:id') do

end
