require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "it must have a unique, case insensitive name" do
    category1 = Category.create(name: "London", type: "Location")
    category2 = Category.create(name: "New York City", type: "Location")
    category3 = Category.create(type: "Location")
    category4 = Category.create(name: "london", type: "Location")

    assert category1.valid?
    assert category2.valid?
    assert category3.invalid?
    assert category4.invalid?
  end
end
