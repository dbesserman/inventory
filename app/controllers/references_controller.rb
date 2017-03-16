class ReferencesController < ApplicationController
  before_action :set_references

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)

    if @reference.save
      flash['success'] = 'Reference successfully created'
      redirect_to root_path
    else
      flash['error'] = 'The reference could not have been created'
      render :new
    end
  end

  private

  def set_references
    @references = Reference.all
  end

  def reference_params
    params.require(:reference).permit(:name)
  end
end
