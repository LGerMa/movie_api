# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: 'admin@admin.com').blank?
  User.create!(
    email: 'admin@admin.com',
    password: 'admin123456',
    name: 'Admin'
  )
  admin = User.find_by(email: 'admin@admin.com')
  admin.add_role(:admin)
  p 'ADMIN CREATED'
end

if User.find_by(email: 'user@user.com').blank?
  User.create!(
    email: 'user@user.com',
    password: 'user123456',
    name: 'User'
  )
  p 'USER CREATED'
end

user = User.find_by(email: 'user@user.com')

5.times do
  hp = Faker::Movies::HarryPotter
  Movie.create!(
    title: hp.book,
    description: hp.quote,
    stock: (10..15).to_a.sample,
    rental_price: (100..1000).to_a.sample,
    sale_price: (100..1000).to_a.sample,
    availability: (1..10).to_a.sample % 2 == 0,
    status: 1
  )
end

3.times do
  movie = Movie.active_and_available.sample
  qty = (1..3).to_a.sample
  user.rentals.create!(
    movie_id: movie.id,
    qty: qty,
    movie_price: movie.rental_price,
    subtotal: movie.rental_price * qty,
    must_returned_at: (Time.now - (0..3).to_a.sample.days).end_of_day
  )
end
p 'RENTALS CREATED'

3.times do
  movie = Movie.active_and_available.sample
  qty = (1..3).to_a.sample
  user.purshases.create!(
    movie_id: movie.id,
    qty: qty,
    movie_price: movie.sale_price,
    subtotal: movie.sale_price * qty,
    total: movie.sale_price * qty
  )
end

p 'PURSHASES CREATED'

3.times do
  movie = Movie.active_and_available.sample
  user.likes.create!(
    movie_id: movie.id
  )
end

p 'LIKES CREATED'