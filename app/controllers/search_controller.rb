class SearchController < ApplicationController
  def index
    @stores = Store.find_api(params[:q])
  end
end
