# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do 
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end


10.times do
  tag = Tag.create(
    title: Faker::App.name
  )
end

10.times do 
  users = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    email: Faker::Internet.free_email,
    age: rand(18..80),
    city_id: rand(1..10),
    password: Faker::Internet.password
  )
end

20.times do
  gossip = Gossip.create!(
    title: Faker::Company.name[3..14],
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: rand(1..10)
  )
end

10.times do
  jointable = JoinTableGossipTag.create!(
    tag_id: rand(1..10),
    gossip_id: rand(1..20)
  )
end

10.times do
  messages = PrivateMessage.create!(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    sender_id: rand(1..10),
    recipient_id: rand(1..10)
  )
end

10.times do
  comment = Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: rand(1..10),
    gossip_id: rand(1..10)
  )
end