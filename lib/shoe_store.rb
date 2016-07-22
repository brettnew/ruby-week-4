class ShoeStore < ActiveRecord::Base
  has_and_belongs_to_many(:shoe_brands)
  validates(:name, {:presence => true})
  before_save(:capitalize_each_word)

  private

  define_method(:capitalize_each_word) do
    self.name = (name.split.map(&:capitalize)*' ')
  end
end
