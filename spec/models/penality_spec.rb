require 'rails_helper'

RSpec.describe Penality, type: :model do
  it { should belong_to :rental }
end
