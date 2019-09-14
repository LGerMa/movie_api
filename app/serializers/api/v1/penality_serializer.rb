class Api::V1::PenalitySerializer < ActiveModel::Serializer
  include GeneralConcern
  attributes :id, :price_per_day, :extra_day

  def price_per_day
    money_format(object.price_per_day)
  end
end
