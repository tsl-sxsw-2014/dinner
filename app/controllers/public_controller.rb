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

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.title = params[:item][:title]
    @item.description = params[:item][:description]
    @item.link = params[:item][:link]
    @item.category = params[:item][:category]

    respond_to do |format|
      if @item.save
        format.html { redirect_to new_path, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
end
