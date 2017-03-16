class Reference < ActiveRecord::Base
  has_many :movements
  has_many :items, through: :movements

  validates :name, presence: true, length: { minimum: 2 }
end
