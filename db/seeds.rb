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
Post.find_or_create_by!(title: 'A Stitch in Time') do |post|
  post.body = 'saves nine'
end

#Comment.find_or_create_by!(body: 'A Stitch in Time')

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

###################################
# Create Posts
#  Every 5th post is titled CENSORED
##################################
count = 1
50.times do
  if count % 5 == 0
    Post.create!(
      topic:  topics.sample,
      title:  "CENSORED",
      body:   RandomData.random_paragraph
      )
  else
    Post.create!(
      topic:  topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
      )
  end
  count += 1
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
#
#=end
#
# advertisement = Advertisement.create([{title: "blah, blah", body: "blah, blah, blah" }])
Advertisement.find_or_create_by!(title: "Budlight") do |ad|
  ad.copy = "Your are up for Whatever"
  ad.price = 500
end

##########################
# Create Advertisement Seeds
##########################
10.times do
    Advertisement.create!(
      title:  RandomData.random_sentence,
      copy:   RandomData.random_paragraph,
      price:  75
      )
end
posts = Advertisement.all

puts "Advertisement Seed finished"
puts "#{Advertisement.count} advertisements created"
