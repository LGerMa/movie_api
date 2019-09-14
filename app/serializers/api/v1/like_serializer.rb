class Api::V1::LikeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :movie
end
