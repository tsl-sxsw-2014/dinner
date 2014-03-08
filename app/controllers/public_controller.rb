require 'open-uri'
require 'json'

class PublicController < ApplicationController
  def random
    num_items = Item.count
    offset_items = Item.offset(rand(num_items))
    @item = offset_items.first

    url = "http://www.loc.gov/pictures/search/?q=#{@item.category}&fo=json"
    response = open(url).read
    parsed_response = JSON.parse(response)
    results = parsed_response["results"]

    @image_url = results[0]['image']['full']
  end
end
