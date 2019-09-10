class Movie < ApplicationRecord
  has_many :likes
  has_many :rentals
  has_many :purshases

  resourcify
  audited only: %i[title description rental_price sale_price], on: :update
end
