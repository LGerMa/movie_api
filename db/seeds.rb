# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  hp = Faker::Movies::HarryPotter
  Movie.create!(
    title: hp.book,
    description: hp.quote,
    stock: (10..15).to_a.sample,
    rental_price: (1000..10000).to_a.sample,
    sale_price: (1000..10000).to_a.sample,
    availability: (1..10).to_a.sample % 2 == 0,
    status: 1
  )
end
