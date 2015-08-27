require 'rails_helper'

RSpec.describe Answer, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  let(:question) { Question.create!(title: "New Question Title", body: "New Question body", resolved: false) }
  let(:answer) { Answer.create!(body: "New Answer body") }
  context "attributes" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
