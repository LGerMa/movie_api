require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :likes }
  it { should have_many :rentals }
  it { should have_many :purshases }
end
