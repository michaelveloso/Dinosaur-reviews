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

dino1 = Dinosaur.create!(
  name: "Giganotosaurus",
  location_found: "South America",
  info_url: "https://en.wikipedia.org/wiki/Giganotosaurus",
  user: TWO,
  description: "This dinosaur is giganotic!"
)
dino2 = Dinosaur.create!(
  name: "Spinosaurus",
  location_found: "North Africa",
  info_url: "https://en.wikipedia.org/wiki/Spinosaurus",
  user: ONE,
  description: "This dinosaur is spiny!"
)
Dinosaur.create!(
  name: "Tyrannosaurus",
  location_found: "Western North America",
  info_url: "https://en.wikipedia.org/wiki/Tyrannosaurus",
  user: TWO,
  description: "This dinosaur has itty bitty arms!"
)
Review.create!(
  dinosaur: dino1,
  user: ONE,
  rating: 5,
  body: "Giga is the coolest, he's totes my favs"
)
Review.create!(
  dinosaur: dino1,
  user: ONE,
  rating: 1,
  body: "Giga is the worst, he's totes not my favs"
)
Review.create!(
  dinosaur: dino1,
  user: ONE,
  rating: 3,
  body: "Giga is really just alright..."
)
