class Item < ActiveRecord::Base
  belongs_to :movement
  has_one :reference, through: :movement

  validates_associated :movement

  def self.available(n=nil)
    if n
      where(in_stock: true, booked: false).limit(n)
    else
      where(in_stock: true, booked: false)
    end
  end

  def self.enough?(reference_id, q)
    available_count = available.joins(movement: :reference)
                        .merge(Reference.where(id: reference_id)).count

    available_count >= q
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

  def booked?
    # for the sake of conventions...
    booked
  end

  private

  def self.add_to_stock(mov_id, q)
    q.times do |_| 
      create(movement_id: mov_id, booked: false, in_stock: true)
    end
  end

  def self.remove_from_stock(reference_id, q)
    Item.joins(movement: :reference).merge(Reference.where(id: reference_id))
      .where(in_stock: true).limit(q)
      .update_all(in_stock: false)

    # reference = Reference.find(reference_id)
    # items = reference.items.where(in_stock: true).limit(q)
    
    # items.each { |item| item.update(in_stock: false) }
  end
end
