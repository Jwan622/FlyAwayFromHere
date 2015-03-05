require 'test_helper'

class UserResearchTest < ActionDispatch::IntegrationTest

  test "a user can see a trip show page via links from root path" do
    visit root_path
    click_button "Icy Exploration"
    click_button "Costa Rica"

    assert page has.content?("Icy Exploration")
  end

  test "a user can click a link and go to that project's external booking
    site" do
    skip
    trip = create(:trip, external_site: "Kayak")

    assert page has.content?("Kayak")
  end
end
