require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :dinosaur do
    sequence(:name) { |n| "Giganotosaurus#{n}" }
    location_found "South America"
    info_url "https://www.en.wikipedia.org/wiki/Giganotosaurus"
  end

  factory :review do
    sequence(:body) { |n| "this one's great!#{n}" }
    rating 3
    dinosaur

  end
end
