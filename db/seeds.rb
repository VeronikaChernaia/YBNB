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

yacht_pictures = [
  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmb.cision.com%2FPublic%2F4617%2F9528502%2F9a95ae41eb2b5835_org.jpg&f=1&nofb=1&ipt=8a5eb277a206656aa087824818c324a977fa1557717d13d8cde21d41a226acea&ipo=images",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.yachtworld.com%2Fresize%2F1%2F60%2F37%2F7716037_20210115071455868_1_XLARGE.jpg%3Ff%3D%2F1%2F60%2F37%2F7716037_20210115071455868_1_XLARGE.jpg%26w%3D5906%26h%3D2953%26t%3D1610723698000&f=1&nofb=1&ipt=d3a509d41b19401ca5941d0da18ad8164f294a20660a025b2c1e9f4f4bfad0f9&ipo=images",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.superyachtfan.com%2Fwp-content%2Fuploads%2F2020%2F08%2FDilbar-156m-Lurssen-33862064078.jpg&f=1&nofb=1&ipt=e036ee3e609eb21b1d48cd51246676f04b7fe8959c7337f83638ba0c30c19e6f&ipo=images",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.fraseryachts.com%2Fuploads%2Fimage%2Fyachts%2Fproject-atalay%2Fthumb_14.-21_project-atalay_15th_1300x878px.jpg&f=1&nofb=1&ipt=216a2fe8326c59a48f8690b9586563d829f0d5dea60ec6df231b5a75d4da78df&ipo=images",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyachtharbour.com%2Fstatic%2Fuploads%2F3111_b2114.jpg&f=1&nofb=1&ipt=a5b6fc7064e1d15d1fba062f276af969628795f37827f15cc0c1b328cf28a85d&ipo=images",
  "https://aquaparkaquaglide.com/wp-content/uploads/2022/03/katina_joe-2.jpg"
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
  ## attach the images to the yachts
  image_url = yacht_pictures.sample
  downloaded_image = URI.open(image_url)
  yacht.photos.attach(io: downloaded_image, filename: "yacht_#{i}.jpg", content_type: 'image/jpeg')

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
