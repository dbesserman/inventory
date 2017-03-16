class Item < ActiveRecord::Base
  belongs_to :movement
  has_one :reference, through: :movement

  def self.available
    where(in_stock: true, booked: false)
  end

  def self.booked
    where(in_stock: true, booked: true)
  end
end
