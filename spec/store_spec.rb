require('spec_helper')

describe(Store) do
  it('has shoe stores associated with it') do
    store = Store.create({:name => 'Foot Locker'})
    brand1 = Brand.create({:name => 'Puma'})
    brand2 = Brand.create({:name => 'Nike'})
    store.update({:brand_ids => [brand1.id, brand2.id]})
    expect(store.brands()).to(eq([brand1, brand2]))
  end

  it('validates presence of stores') do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it('capitalizes first letter of each word in shoe store') do
    store = Store.create({:name => 'foot locker'})
    expect(store.name()).to(eq('Foot Locker'))
  end
end
