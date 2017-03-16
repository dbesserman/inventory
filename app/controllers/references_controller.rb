class ReferencesController < ApplicationController
  def new
    @reference = Reference.new
    @references = Reference.all
  end

  def create
    @reference = Reference.new(reference_params)
    @references = Reference.all

    if @reference.save
      flash['success'] = 'Reference successfully created'
      redirect_to root_path
    else
      flash['error'] = 'The reference could not have been created'
      render :new
    end
  end

  private

  def reference_params
    params.require(:reference).permit(:name)
  end
end
