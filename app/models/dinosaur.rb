class Dinosaur < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location_found, presence: true
  validates :info_url, presence: true
end
