class ItemsController < ApplicationController
  def index
    @available_items = Item.available
    @booked_items = Item.booked
  end

  def book
    item = Item.find(params[:id])
    item.booked = true
    item.save

    redirect_to items_path
  end
end
