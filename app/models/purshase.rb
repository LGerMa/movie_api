class Purshase < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  audited

  after_create :reduce_stock

  private

  def reduce_stock
    Movie.find(self.movie_id).reduce_stock(self.qty)
  end
end
