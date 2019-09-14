class Purshase < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  audited

  after_create :reduce_stock

  scope :ordered, -> { order(created_at: :desc) }

  private

  def reduce_stock
    Movie.find(self.movie_id).reduce_stock(self.qty)
  end
end
