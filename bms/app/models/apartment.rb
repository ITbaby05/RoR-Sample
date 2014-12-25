class Apartment < ActiveRecord::Base
  validates :room, presence: true, length: {maximum: 50}
  validates :floor, presence: true
  validates :area, presence: true
  validates :price, presence: true

end
