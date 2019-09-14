class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tokens, class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id
  has_one :current_token, -> { order 'created_at DESC' }, class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id

  has_many :likes
  has_many :rentals
  has_many :purshases

  after_create :assign_default_role

  class << self
    def authenticate!(email, password)
      user = User.find_for_authentication(email: email)
      user.try(:valid_password?, password) ? user : nil
    end
  end

  def assign_default_role
    add_role(:user)
  end
end
