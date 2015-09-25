# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

# post = Post.create([{title: "blah, blah", body: "blah, blah, blah" }])
#=begin
#

# Create Users
5.times do
  user = User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
    )
  end
users = User.all

#################
#Post.find_or_create_by!(title: 'A Stitch in Time') do |post|
#  post.body = 'saves nine'
#end
#############

#Comment.find_or_create_by!(body: 'A Stitch in Time')
#if Rails.env.development?
#
# Topic.delete_all

  # Create Topics
  15.times do
   topic =  Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
    )
  end
  topics = Topic.all
#end

###################################
# Create Posts
#  Every 5th post is titled CENSORED
##################################
#count = 1
#50.times do
#  if count % 5 == 0
#    Post.create!(
#      topic:  topics.sample,
#      title:  "CENSORED",
#      body:   RandomData.random_paragraph
#      )
#  else
50.times do
    post = Post.create!(
      user:   users.sample,
      topic:  topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
      )
#  end
#  count += 1
  end
posts = Post.all

# Create Comments
100.times do
  comment = Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
comments = Comment.all

#####################
#user = User.first
#user.update_attributes!(
#  email: 'youremail.com',
#  password: 'helloworld'
#)
# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

#Create a moderator
 moderator = User.create!(
  name:     "Moderator User",
  email:    "moderator@example.com",
  password: "helloworld",
  role:     "moderator"
)
#####################





puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
#
#=end
#
# advertisement = Advertisement.create([{title: "blah, blah", body: "blah, blah, blah" }])
#Advertisement.find_or_create_by!(title: "Budlight") do |ad|
#  ad.copy = "Your are up for Whatever"
#  ad.price = 500

##########################
# Create Advertisement Seeds
##########################
#10.times do
#    Advertisement.create!(
#      title:  RandomData.random_sentence,
#      copy:   RandomData.random_paragraph,
#      price:  75
#      )
#end
#posts = Advertisement.all

#puts "Advertisement Seed finished"
#puts "#{Advertisement.count} advertisements created"
#end
