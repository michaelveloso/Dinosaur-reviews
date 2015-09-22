class Dinosaur < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location_found, presence: true
  validates :info_url, presence: true
  validates :user_id, presence: true
end
