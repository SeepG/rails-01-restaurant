# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start of Seeding...'
Restaurant.destroy_all
20.times do
  params = {
    title: Faker::Restaurant.unique.name,
    address: Faker::Address.unique.full_address,
    food_type: Faker::Restaurant.type,
    description: Faker::Lorem.paragraph
  }
  puts "Creating Restaurant: #{params[:title]}"
  restaurant = Restaurant.new(params)
  restaurant.save

  reviews = rand(6)
  reviews.times do
    params = {
      title: Faker::Restaurant.unique.name,
      rating: rand(5),
      content: Faker::Lorem.paragraph,
      restaurant_id: restaurant.id
    }
    puts "Creating review: #{params[:title]}"
    review = Review.new(params)
    review.save
  end
  puts 'Creating an admin user'
  admin_user = User.new({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => 'true'})
  admin_user.save
  
puts 'Seeding Over'
