class User < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :reviews, through: :votes
  has_many :dinosaurs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    admin
  end
end
