class Reference < ActiveRecord::Base
  has_many :movements

  validates :name, presence: true, length: { minimum: 2 }
end
