require('spec_helper')

describe(Brand) do
  it('has shoe stores associated with it') do
    brand = Brand.create({:name => 'Puma'})
    store1 = Store.create({:name => 'Foot Locker'})
    store2 = Store.create({:name => 'Famous Footwear'})
    brand.update({:store_ids => [store1.id, store2.id]})
    expect(brand.stores()).to(eq([store1, store2]))
  end

  it('validates presence of brands') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it('capitalizes first letter of each word in shoe brand') do
    brand = Brand.create({:name => 'air jordan'})
    expect(brand.name()).to(eq('Air Jordan'))
  end
end
