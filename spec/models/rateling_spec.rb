require 'rails_helper'

RSpec.describe Rateling, type: :model do
  it { should belong_to :rateable }
end
