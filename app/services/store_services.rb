class StoreServices
  
  def initialize(zip)
    @zip = zip  
    @conn = Faraday.new("https://api.bestbuy.com")
  end

  def self.find_by_zip(zip)
    service = StoreServices.new(zip)
    service.find_by_zip
  end
  
  def find_by_zip
    response = @conn.get("/v1/stores(area(#{@zip},25))?format=json&show=name,city,distance,phone,storeType,storeId&pageSize=16&apiKey=#{ENV['storedom_api_key']}")
    raw_stores = JSON.parse(response.body)['stores']

    raw_stores.map do |store|
      Store.new(store)
    end
  end
end
