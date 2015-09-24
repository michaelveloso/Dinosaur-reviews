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
if Rails.env.development?
  UserSeeder.seed!
  DinosaurSeeder.seed!
  ReviewSeeder.seed!
end
