class MovementsController < ApplicationController
  before_action :set_references, only: [:new, :create]

  def index
    @movements = Movement.all
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      Item.process(@movement)
      flash[:success] = 'Movement successfully registered'
      redirect_to movements_path
    else
      flash[:error] = 'Movement could not have been registered'
      render :new
    end
  end

  private

  def set_references
    @references = Reference.all
  end

  def movement_params
    {
      reference_id: params[:reference_id].to_i,
      quantity: params[:quantity].to_i,
      comming_in: params[:direction] == 'in'
    }
  end
end
