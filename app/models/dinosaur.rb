class Dinosaur < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location_found, presence: true
  validates :info_url, presence: true
end
