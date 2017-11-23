# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  u = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Crypto.md5

    )
end


10.times do
  r = Listing.create!(
    title: Faker::SiliconValley.app,
    price: Faker::Number.number(2),
    description: Faker::SiliconValley.motto,
    zip: %w(10103 10169 10178 10352).sample,
    city: "Berlin",
    category: %w(Handwerksleistungen Umzüge Reinigung).sample,
    user_id: rand(1..10),
    remote_photo_url: "https://picsum.photos/200/300/?random",
    )
    r.address = "#{r.zip} #{r.city} Germany"
    r.save
end
