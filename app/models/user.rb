class User < ActiveRecord::Base
  has_many :dinosaurs
  has_many :reviews
  has_many :comments
  has_many :votes
  has_many :reviews, through: :votes

  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
