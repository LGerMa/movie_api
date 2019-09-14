FactoryBot.define do
  factory :admin, class: 'User' do
    name { Faker::TvShows::GameOfThrones.character }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    after :create do |user|
      user.add_role :admin
    end
  end

  factory :user, class: 'User' do
    name { Faker::TvShows::GameOfThrones.character }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    after :create do |user|
      user.add_role :user
    end
  end
end