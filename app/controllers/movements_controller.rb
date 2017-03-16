class MovementsController < ApplicationController
  def index
    @movements = Movement.all
  end

  def new
    @movement = Movement.new
    @references = Reference.all
  end

  def create
    @references = Reference.all
    @movement = Movement.new(movement_params)

    if @movement.save
      flash[:success] = 'Movement successfully registered'
      redirect_to movements_path
    else
      flash[:error] = 'Movement could not have been registered'
      render :new
    end
  end

  private

  def movement_params
    {
      reference_id: params[:reference_id].to_i,
      quantity: params[:quantity].to_i,
      comming_in: params[:direction] == 'in'
    }
  end
end
