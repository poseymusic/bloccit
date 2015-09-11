require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#
let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:sp) { SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1) }

it { should belong_to(:topic) }

context "attributes" do
   it "should respond to title" do
     expect(sp).to respond_to(:title)
   end
   it "should respond to body" do
     expect(sp).to respond_to(:body)
   end
   it "should respond to body" do
     expect(sp).to respond_to(:price)
   end
 end
end
