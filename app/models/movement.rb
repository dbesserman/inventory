class Movement < ActiveRecord::Base
  belongs_to :reference
  has_many :items

  after_create :process_items

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates_associated :reference
  validate :must_have_enough_items_in_stock, if: :outgoing?

  def comming_in?
    # for the sake of conventions...
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
    unless Item.enough?(reference.id, quantity) 
      errors.add(:quantity, "can't be greater than the number of available items")
    end
  end
end
