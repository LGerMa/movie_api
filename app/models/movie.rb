class Movie < ApplicationRecord
  has_many :likes
  has_many :rentals
  has_many :purshases

  resourcify
  audited only: %i[title description rental_price sale_price availability], on: :update

  enum status: { 'inactive': 0, 'active': 1 }

  scope :active_and_available, -> { where(" availability = ? AND status = ?", true, 1)}

  def reduce_stock(qty)
    self.decrement(:stock, qty) if self.stock > 0
    self.save
  end

  def increment_stock(qty)
    self.increment(:stock, qty)
    self.save
  end
end
