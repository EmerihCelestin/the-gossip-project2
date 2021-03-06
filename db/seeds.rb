# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# 10.times do 
# 	cities = City.create(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
# end	
# city = City.all
# city_id =[]
# city.each	do |city| 
# city_id << city.id
# end
 20.times do 
 	users = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4), email: Faker::Internet.email, age: Faker::Number.between(from: 18, to: 90),city_id: city_id[rand(0..city_id.length)],password: "emerih18" ,password_confirmation: "emerih18")
 end
user = User.all
user_id =[]
user.each	do |user| 
user_id << user.id
end

20.times do 
	gossips = Gossip.create(title: Faker::Music.album, content: Faker::Movie.quote,user_id: user_id[rand(0..user_id.length)])
end	
gossip = Gossip.all
gossip_id =[]
gossip.each	do |gossip| 
gossip_id << gossip.id
end

50.times do
 comments = Comment.create(content: Faker::Movie.quote,user_id: user_id[rand(0..user_id.length)], gossip_id: gossip_id[rand(0..gossip_id.length)])
end	

10.times do
	tags = Tag.create(title: "##{Faker::Book.title}")
end 

100.times do
	tag_gossips = TagGossip.create(tag_id: Faker::Number.between(from: 1, to: 10), gossip_id: Faker::Number.between(from: 1, to: 20))  
end 
 	
 	anonyms = User.create(first_name: "anonyms", last_name: "anonyms", description: "anonyms", email:"anonyms", age: 0, city_id: 8  )