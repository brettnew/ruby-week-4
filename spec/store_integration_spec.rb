require('spec_helper')

describe('shoe store functionality through application', {:type => :feature}) do
  it('allows a user to add a new shoe store') do
    visit('/')
    click_link('View All Shoe Stores')
    fill_in('store_name', :with => "
    foot locker")
    click_button('Add Store')
    expect(page).to have_content('Foot Locker')
  end

  it('allows user to create shoe brand') do
    visit('/')
    click_link('View All Shoe Brands')
    fill_in('brand_name', :with => 'Nike')
    click_button('Add Brand')
    expect(page).to have_content ('Nike')
  end

  it('allows a user to view details for single shoe store') do
    Store.create({:name => 'Foot Locker'})
    visit('/stores')
    click_link('Foot Locker')
    expect(page).to have_content('Foot Locker Inventory')
  end

  it('allows a user to associate a brand with a shoe store') do
    Store.create({:name => 'Foot Locker'})
    Brand.create({:name => 'Nike'})
    visit('/stores')
    click_link('Foot Locker')
    check('brand_id[]')
    click_button('Add Brands')
    expect(page).to have_content('Nike')
  end

  it('allows the user to delete a shoe store') do
    Store.create({:name => "Foot Locker"})
    visit('/stores')
    click_link ('Edit')
    click_button ('Delete')
    expect(page).to have_no_content('Foot Locker')
  end

  it('allows the user to edit a shoe stores name') do
    Store.create({:name => "Foot Locker"})
    visit('/stores')
    click_link ('Edit')
    fill_in('store_name', :with => "Famous Footwear")
    click_button ('Update')
    expect(page).to have_content('Famous Footwear')
  end
end
