require 'test_helper'

class PlannerTest < ActionDispatch::IntegrationTest
  attr_reader :user

  test "quality select down box has options that say super-cheap and valuable" do
    user = build(:user)

    visit root_path

    assert page.has_select?("plan[quality_category]", options: ["Quality"])
  end

  test "proximity select down box has options that say international and
    domestic" do
    visit root_path

    assert page.has_select?("plan[location_category]", options: ["Proximity"])
  end

end
