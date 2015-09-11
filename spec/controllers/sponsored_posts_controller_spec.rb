require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
  let (:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let (:sp_post) { SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, topic_id: my_topic.id) }
######
  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the show #view" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(response).to render_template :show
    end
    it "assigns sp_post to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(assigns(:sponsored_post)).to eq(sp_post)
    end
  end
#####
  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end
#
  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: sp_post.id
      expect(response).to have_http_status(:success)
    end
  end
#

end
