require "rails_helper"

RSpec.feature "As a user" do
  it "they can see all stores" do
    visit "/"
    fill_in :q, with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("16 total stores")
      expect(page).to have_content("Store name: ")
      expect(page).to have_content("Store city: ")
      expect(page).to have_content("Store distance: ")
      expect(page).to have_content("Store phone number: ")
      expect(page).to have_content("Store type:")
  end
end


# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results



# https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=name,city,distance,phone,storeType,storeId&pageSize=16&apiKey=7a3heu7emrjz6qbsugmepbv6