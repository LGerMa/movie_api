class Api::V1::MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :rental_price, :sale_price

  def rental_price
    Money.new(object.rental_price, "USD").format
  end

  def sale_price
    Money.new(object.sale_price, "USD").format
  end
end
