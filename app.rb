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
  @store = Store.find(params.fetch("id").to_i)
  @brands = Brand.all
  erb(:store)
end



patch('/stores/:id') do
  new_brand_ids = params.fetch('brand_id')
  @store = Store.find(params.fetch('id').to_i)
  brand_ids_array = []
  @store.brands.each do |brand|
    brand_ids_array.push(brand.id)
  end
  new_brand_ids.each() do |id|
    brand_ids_array.push(id.to_i)
  end
  @store.update({:brand_ids => brand_ids_array})
  redirect back
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i)
  erb(:stores_edit)
end

get('/brands/:id/edit') do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brands_edit)
end

patch('/stores/:id/edit') do
  name = params.fetch('store_name')
  @store = Store.find(params.fetch('id').to_i)
  @store.update({:name => name})
  @stores = Store.all
  redirect('/stores')
end

delete('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i)
  @store.destroy()
  @stores = Store.all
  redirect('/stores')
end

patch('/brands/:id/edit') do
  name = params.fetch('brand_name')
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.update({:name => name})
  @brands = Brand.all
  redirect('/brands')
end

delete('/brands/:id/edit') do
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.destroy()
  @brands = Brand.all
  redirect('/brands')
end
