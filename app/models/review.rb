class Review < ActiveRecord::Base
  paginates_per 3
  belongs_to :dinosaur
  belongs_to :user
  has_many :comments
  has_many :votes
  has_many :users, through: :votes

  validates :dinosaur, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5, message: "Must be between 1 and 5" }
  validates :rating, numericality: { only_integer: true }

  def tally
    sum = 0
    votes.each do |vote|
      sum += vote[:value]
    end
    sum
  end
end
