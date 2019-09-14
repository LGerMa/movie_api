class Api::V1::PurshaseSerializer < ActiveModel::Serializer
  include GeneralConcern
  attributes :id, :qty, :movie_price, :subtotal, :total
  belongs_to :movie
  belongs_to :user

  def movie_price
    money_format(object.movie_price)
  end

  def subtotal
    money_format(object.subtotal)
  end

  def total
    money_format(object.total)
  end
end
