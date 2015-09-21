require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
  
  factory :dinosaur do
    sequence(:name) {|n| "dinosaur #{n}" }
    location_found "asf "
    info_url "www.wow.com"
  end

end
