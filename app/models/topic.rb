class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  has_many :rateables, as: :rateable
  has_many :ratings, through: :rateables



  validates :name,        length: { minimum: 5  }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
end
