class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_one :penality

  enum status: { 'on_time': 0, 'pending': 1, 'done': 2}
  audited

  after_create :reduce_stock

  before_save :increment_stock, if: :will_save_change_to_returned_at?


  private

  def reduce_stock
    Movie.find(self.movie_id).reduce_stock(self.qty)
  end

  def increment_stock
    Movie.find(self.movie_id).increment_stock(self.qty)
    if self.returned_at > self.must_returned_at
      #penality
      price_per_day = self.subtotal * 0.10
      extra_days = (self.returned_at.to_date - self.must_returned_at.to_date).to_i
      price_extra = price_per_day * extra_days
      Penality.create!(
        rental_id: self.id,
        price_per_day: price_per_day,
        extra_day: extra_days
      )
      self.total = self.subtotal + price_extra.to_i
    end
  end
end
