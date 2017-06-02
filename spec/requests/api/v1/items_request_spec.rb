require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    item1 = Item.create(name: "car", description: "fast", image_url: "url")
    item2 = Item.create(name: "house", description: "big", image_url: "url")
    item = [item1, item2]
    get '/api/v1/items'

    expect(response).to be_success
    items = JSON.parse(response.body)
    item = items.first

    expect(items.count).to eq(2)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
  end

  it "can get one item by its id" do
    id = Item.create(name: "car", description: "fast", image_url: "url").id
    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can create a new item" do

    item_params = {name: "Chocolate", description: "dark", image_url: "url"}
   
    post "/api/v1/items", {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
  end
end
