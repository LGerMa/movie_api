require 'rails_helper'

RSpec.describe Rental, type: :model do
  it { should belong_to :movie }
  it { should belong_to :user }
  it { should have_one :penality }
end
