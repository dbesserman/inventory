class Movement < ActiveRecord::Base
  belongs_to :reference

  def comming_in?
    self.comming_in ? true : false
  end

  def booked?
    self.booked ? true : false
  end
end
