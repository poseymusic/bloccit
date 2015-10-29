class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }
# before_save { self.name = name.downcase.split(" ").each { |f| f.capitalize! }.join(" ") }
  before_save :capitalize_name

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, length: { minimum: 6 }, presence: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 } ,
             format: { with: EMAIL_REGEX }
  has_secure_password

  enum role: [:member, :admin, :moderator]

  def capitalize_name
    if name.present?
    self.name = name.split(" ").each { |f| f.capitalize! }.join(" ")
    end
  end
  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end  
end
