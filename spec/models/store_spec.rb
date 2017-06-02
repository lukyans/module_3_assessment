require 'rails_helper'

RSpec.describe Store, type: :model do
  it "store exists" do
    raw_store =
      {
        "name" => "CHERRY CREEK MALL",
        "city" => "DENVER",
        "distance" => 3.45,
        "phone" => "303-270-9189",
        "storeType" => "Mobile SAS",
        "storeId" => 2740
      }
      store = Store.new(raw_store)

      expect(store.name).to eq("CHERRY CREEK MALL")
      expect(store.city).to eq("DENVER")
      expect(store.distance).to eq(3.45)
      expect(store.phone).to eq("303-270-9189")
      expect(store.store_type).to eq("Mobile SAS")
  end
end
