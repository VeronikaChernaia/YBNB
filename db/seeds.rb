# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Yacht.destroy_all
Review.destroy_all
User.destroy_all


yacht_titles = [
  "Sea Breeze",
  "Ocean Explorer",
  "Wave Rider",
  "Sunset Cruiser",
  "Blue Horizon",
  "Island Hopper",
  "Nautical Dream",
  "Marine Majesty",
  "Aqua Escape",
  "Sailor's Delight"
]


yacht_brand = [
  "Azimut",
  "Sunseeker",
  "Ferretti",
  "Princess Yachts",
  "Benetti"
]


port_names = [
  "Monaco",
  "Nice",
  "Cannes",
  "Dubai",
  "Saint-Tropez"
]


short_reviews = [
  "Fantastic experience! The yacht was beautiful.",
  "Loved every minute on board, highly recommend!",
  "Perfect getaway on the water, will book again.",
  "The yacht was stunning, and the crew was top-notch.",
  "Amazing views and luxury comfort, a great trip!",
  "The best yacht experience we’ve ever had.",
  "Incredible service and a breathtaking yacht.",
  "A wonderful day at sea, couldn’t have asked for more.",
  "The yacht exceeded our expectations in every way.",
  "Truly a memorable and luxurious experience."
]


yacht_descriptions = [
  "A sleek and modern yacht, perfect for a luxurious getaway on the water.",
  "Experience ultimate relaxation aboard this spacious and elegant vessel.",
  "Cruise in style with this top-of-the-line yacht, featuring all modern amenities.",
  "A stunning yacht with breathtaking views, ideal for a sunset cruise.",
  "This yacht offers the perfect blend of comfort and sophistication for your adventure.",
  "Enjoy the open sea with this beautifully designed yacht, made for unforgettable journeys.",
  "A luxurious yacht that promises a smooth and memorable sailing experience.",
  "Sail the seas in this modern masterpiece, complete with all the comforts of home.",
  "This yacht is your gateway to exploring the ocean in style and comfort.",
  "An elegant and well-equipped yacht, perfect for both relaxation and adventure."
]



owner = User.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  password: "password123", # This will be automatically encrypted by Devise
  password_confirmation: "password123"
)

booker = User.create!(
  first_name: "Jane",
  last_name: "Smith",
  email: "jane.smith@example.com",
  password: "password123", # This will be automatically encrypted by Devise
  password_confirmation: "password123"
)

puts "2 users created"


10.times do |i|
  yacht = Yacht.create!(
    title: yacht_titles.sample,
    brand: yacht_brand.sample,
    user_id: owner.id,
    price_per_hour: rand(500..2000),
    description: yacht_descriptions.sample,
    port: port_names.sample,
    owner: owner
  )
  puts "yacht #{i} created"


  3.times do |x|
    Review.create!(
      yacht: yacht,
      rating: rand(1..5),
      user_id: booker.id,
      content: "This is review for Yacht #{yacht.title}: #{short_reviews.sample}",
      date_reviewed: Date.today - rand(1..100).days
    )


    puts "review #{x} for yacht #{i} created"
  end
end
puts "Seeded 10 yachts with 3 reviews each."


2.times do |i|
  yacht_to_book = Yacht.all.sample

  Booking.create!(
    yacht_id: yacht_to_book.id,
    user_id: booker.id,
    check_in_date: Date.today + rand(1..30).days,
    check_out_date: Date.today + rand(31..60).days,
    booking_status: "pending"
  )

  #duration_in_days = (yacht_to_book.check_out_date - yacht_to_book.check_in_date).to_i
  #total_hours = duration_in_days * 24
  #booking.update!(final_price: total_hours * yacht_to_book.price_per_hour)

  puts "Booking #{i + 1} for Yacht #{yacht_to_book.title} created"
end
