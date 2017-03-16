class Item < ActiveRecord::Base
  belongs_to :movement
  has_one :reference, through: :movement

  def self.available
    self.where(in_stock: true, booked: false)
  end

  private

  def has_available?(n)
    self.available.count >= n
  end
end
