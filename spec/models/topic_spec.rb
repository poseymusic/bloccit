require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  let(:topic) { create(:topic) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:name).is_at_least(5) }
  it { should validate_length_of(:description).is_at_least(15) }
  it { should have_many(:posts) }

  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }

  describe "attributes" do
    it "should respond to name" do
      expect(topic).to respond_to(:name)
    end

    it "should respond to description" do
      expect(topic).to respond_to(:description)
    end

    it "should respond to public" do
      expect(topic).to respond_to(:public)
    end
    # #2
    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
#
end
