class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
#o  before_save { self.name = name.downcase.split(" ").each { |f| f.capitalize! }.join(" ") }
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

  def capitalize_name
    if name.present?
      self.name = name.split(" ").each { |f| f.capitalize! }.join(" ")
    end
  end
end
