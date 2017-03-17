class Item < ActiveRecord::Base
  belongs_to :movement
  has_one :reference, through: :movement

  def self.available(n=nil)
    if n
      where(in_stock: true, booked: false).limit(n)
    else
      where(in_stock: true, booked: false)
    end
  end

  def self.in_stock
    where(in_stock: true)
  end

  def self.booked
    where(in_stock: true, booked: true)
  end

  def self.process(movement)
    if movement.comming_in?
      add_to_stock(movement.id, movement.quantity)
    else 
      remove_from_stock(movement.reference_id, movement.quantity)
    end
  end

  private

  def self.add_to_stock(mov_id, q)
    q.times do |_| 
      create(movement_id: mov_id, booked: false, in_stock: true)
    end
  end

  def self.remove_from_stock(reference_id, q)
    reference = Reference.find(reference_id)
    items = reference.items.limit(q)

    items.each do |item|
      item.in_stock = false
      item.save
    end
  end
end
