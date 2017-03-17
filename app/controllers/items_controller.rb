class ItemsController < ApplicationController
  def index
    @items_in_stock = Item.in_stock
    @references = Reference.all
  end

  def book
    item = Item.find(params[:id])
    item.booked = true
    item.save

    redirect_to items_path
  end
end
