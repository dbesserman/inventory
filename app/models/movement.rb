class Movement < ActiveRecord::Base
  belongs_to :reference
  has_many :items

  after_create :process_items

  validate :must_have_enough_items_in_stock, if: :outgoing?

  def comming_in?
    comming_in
  end

  private

  def process_items
    # Every stock comming in leads to a creation of items 
    # Every stock item going out leads to a modification of these items state
    Item.process(self)
  end

  def outgoing?
    !comming_in
  end

  def must_have_enough_items_in_stock
    unless enough_items?(reference, quantity) 
      errors.add(:quantity, "can't be greater than the number of available items")
    end
  end

  def enough_items?(reference, q)
    available_count = reference.items.where(in_stock: true, booked: false).count
    available_count >= q
  end
end
