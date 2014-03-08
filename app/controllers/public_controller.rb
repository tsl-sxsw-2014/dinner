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

    random_num = rand(results.count)
    result = results[random_num]

    if (result['image']['alt'].include? "not digitized") || (result['image']['alt'].include? "Look magazine")
      @image_url = "http://cdn.sheknows.com/articles/2011/02/Fork_knife_and_plate.jpg"
    else
      @image_url = result["image"]["full"]
    end
  end
end
