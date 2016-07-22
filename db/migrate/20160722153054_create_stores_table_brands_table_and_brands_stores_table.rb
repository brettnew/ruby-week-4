class CreateStoresTableBrandsTableAndBrandsStoresTable < ActiveRecord::Migration
  def change
    create_table(:shoe_brands) do |t|
      t.column(:name, :string)
    end
    create_table(:shoe_stores) do |t|
      t.column(:name, :string)
    end
    create_table(:shoe_brands_shoe_stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
