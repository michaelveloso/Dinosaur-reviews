# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# t.string :name, null: false
# t.string :location_found, null: false
# t.string :info_url, null: false
# t.string :photo_url
# t.belongs_to :user

ONE = User.create!(
  email: "name@gmail.com",
  password: "password",
  password_confirmation: "password"
)

TWO = User.create!(
  email: "someone@gmail.com",
  password: "password",
  password_confirmation: "password"
)

Dinosaur.create!(
  name: "Giganotosaurus",
  location_found: "South America",
  info_url: "https://en.wikipedia.org/wiki/Giganotosaurus",
  user: TWO,
  description: "This dinosaur is giganotic!"
)
Dinosaur.create!(
  name: "Spinosaurus",
  location_found: "North Africa",
  info_url: "https://en.wikipedia.org/wiki/Spinosaurus",
  user: ONE,
  description: "This dinosaur is spiny!"
)
