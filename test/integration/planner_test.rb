require 'test_helper'

class PlannerTest < ActionDispatch::IntegrationTest
  attr_reader :user

  test "in the new planner box there is a select dropdown that list the destinations" do
    category = create(:category)

    visit root_path

    assert page.has_select?("plan[destination]", with_options: ["Delhi", "Destination"])
  end

  test "in the new planner box there is a select dropdown that list the origins" do
    category = create(:category)

    visit root_path

    assert page.has_select?("plan[origin]", options: ["Delhi", "Origin"])
  end

  test "in the new planner box there is a select dropdown that list the prices" do
    visit root_path
    save_and_open_page

    assert page.has_select?("plan[max_price]", options: ["Price", "$250", "$500", "$750", "$1000", "$1250", "$1500", "No Limit Baby"])
  end

end
