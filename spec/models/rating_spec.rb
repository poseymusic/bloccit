require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
  it { should belong_to :rateable }

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:rating) { Rating.create!(severity: 'PG') }
  let(:rating2) { Rating.create!(severity: 'PG13') }
  let(:rating3) { Rating.create!(severity: 'R') }

  it { should belong_to :rateable }
  it { should have_many :ratelings }
  it { should have_many :topics }
  it { should have_many :posts }

  describe "rateable" do
    it "allows the same rating to be associated with a different topic and post" do
      topic.ratings << rating
      post.ratings << rating

      topic_rating = topic.ratings[0]
      post_rating = post.ratings[0]
      expect(topic_rating).to eql(post_rating)
    end
  end
##################################
  describe "attributes" do
    it "should respond to role" do
      expect(rating).to respond_to(:severity)
    end
    it "should respond to admin?" do
      expect(user).to respond_to(:admin?)
    end
    it "should respond to member?" do
      expect(user).to respond_to(:member?)
    end
  end
  describe "roles" do
    it "should be member by default" do
      expect(user.role).to eql("member")
    end
    context "member user" do
      it "should return true for #member?" do
        expect(user.member?).to be_truthy
      end
    it "should return false for #admin?" do
      expect(user.admin?).to be_falsey
    end
  end
  context "admin user" do
    before do
      user.admin!
    end
    it "should return false for #member?" do
      expect(user.member?).to be_falsey
    end
    it "should return true for #admin?" do
      expect(user.admin?).to be_truthy
    end
  end
#  describe ".update_rating" do
#    it "takes a defaults to PG" do
#      labels = "#{label.severity}, #{label2.severity}"
#      labels_as_a = [label, label2]
#      expect(Rating.update_rating(0)).to eq("PG")
#    end
#  end
end
