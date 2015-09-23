class Review < ActiveRecord::Base
  belongs_to :dinosaur
  belongs_to :user
  has_many :comments

  validates :dinosaur, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5, message: "Must be between 1 and 5" }
  validates :rating, numericality: { only_integer: true }
end
