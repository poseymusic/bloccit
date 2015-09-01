require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let (:my_ad) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 3000) }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end
#RSpec.describe AdvertisementsController, type: :controller do
####Create
  describe "create" do
    it "increases the number of Advertisements by 1" do
      expect{advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 }}.to change(Advertisement,:count).by(1)
    end
    it "assigns the new advertisement to @advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 }
      expect(assigns(:advertisement)).to eq Advertisement.last
    end
    it "redirects to the new advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 }
      expect(response).to redirect_to Advertisement.last
    end
  end

#  let (:my_ad) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0) }










#
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
