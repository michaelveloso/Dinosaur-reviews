class Dinosaur < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :location_found, presence: true
  validates :info_url, presence: true
  validates :user, presence: true
  validates :description, presence: true

  mount_uploader :dino_photo, DinoPhotoUploader
  def self.search(query)
    where("name ILIKE ?", "%#{query}%")
  end
end
