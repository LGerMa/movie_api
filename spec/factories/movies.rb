FactoryBot.define do
  factory :movie, class: 'Movie' do
    title { Faker::Movies::HarryPotter.book }
    description { Faker::Movies::HarryPotter.quote }
    stock { (10..15).to_a.sample }
    rental_price { (1000..10000).to_a.sample }
    sale_price { (1000..10000).to_a.sample }
    availability { (1..10).to_a.sample % 2 == 0}
    status { 1 }
  end
end