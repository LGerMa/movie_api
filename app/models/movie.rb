class Movie < ApplicationRecord
  #assosiation
  has_many :likes
  has_many :rentals
  has_many :purshases
end
