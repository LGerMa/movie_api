class Api::V1::RentalSerializer < ActiveModel::Serializer
  include GeneralConcern
  attributes :id, :qty, :movie_price, :subtotal, :total, :must_returned_at, :returned_at
  belongs_to :movie
  belongs_to :user
  has_one :penality

  def movie_price
    money_format(object.movie_price)
  end

  def subtotal
    money_format(object.subtotal)
  end

  def total
    money_format(object.total)
  end

  def must_returned_at
    date_format(object.must_returned_at)
  end

  def returned_at
    date_format(object.returned_at) unless object.returned_at.nil?
  end
end
