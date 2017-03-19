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

  def filter
    id = params[:reference_id]
    redirect_to items_reference_path(id)
  end
end
