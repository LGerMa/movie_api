require 'rails_helper'

RSpec.describe Purshase, type: :model do
  it { should belong_to :user }
  it { should belong_to :movie }
end
