class Api::V1::MovieSerializer < ActiveModel::Serializer
  include GeneralConcern
  attributes :id, :title, :description, :rental_price, :sale_price, :availability

  def rental_price
    money_format(object.rental_price)
  end

  def sale_price
    money_format(object.sale_price)
  end
end
