require 'rails_helper'
include RandomData
#  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
#  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
#  let(:post) { Topic.post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

RSpec.describe Comment, type: :model do

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }
  #pending "add some examples to (or delete) #{__FILE__}"
  context "attributes" do
    # let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
    # let(:comment) { Comment.create!(body: "Comment Body") }
    it "should respond to body" do
     expect(comment).to respond_to(:body)
    end
  end
end
