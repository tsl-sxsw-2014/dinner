class PublicController < ApplicationController
  def random
    num_items = Item.count
    offset_items = Item.offset(rand(num_items))
    @item = offset_items.first
  end
end
