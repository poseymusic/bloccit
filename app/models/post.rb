class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  scope :order_desc, -> { order('created_at DESC') }
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

 #### additional scopes ######
  def self.order_by_title
    order('title')
  end

  def self.order_by_reversed_created_at
    order('created_at ASC')
  end
end
