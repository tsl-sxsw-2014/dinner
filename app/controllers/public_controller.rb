class PublicController < ApplicationController
  def random
    @item = Item.first
  end
end
