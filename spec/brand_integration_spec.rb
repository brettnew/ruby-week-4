require('spec_helper')

describe('shoe store functionality through application', {:type => :feature}) do
  it('allows user to create shoe brand') do
    visit('/')
    click_link('View All Shoe Brands')
    fill_in('brand_name', :with => 'Nike')
    click_button('Add Brand')
    expect(page).to have_content ('Nike')
  end

  it('allows a user to view details for single shoe brand') do
    Brand.create({:name => 'Nike'})
    visit('/brands')
    click_link('Nike')
    expect(page).to have_content('Where to find Nike')
  end

  it('allows the user to delete a brand') do
    Brand.create({:name => "Nike"})
    visit('/brands')
    click_link ('Edit')
    click_button ('Delete')
    expect(page).to have_no_content('Nike')
  end

  it('allows the user to edit a shoe stores name') do
    Brand.create({:name => "Nike"})
    visit('/brands')
    click_link ('Edit')
    fill_in('brand_name', :with => "Puma")
    click_button ('Update')
    expect(page).to have_content('Puma')
  end
end
