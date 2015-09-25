class Review < ActiveRecord::Base
  paginates_per 3
  belongs_to :dinosaur
  belongs_to :user
  has_many :comments
  acts_as_votable

  validates :dinosaur, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5, message: "Must be between 1 and 5" }
  validates :rating, numericality: { only_integer: true }
end
