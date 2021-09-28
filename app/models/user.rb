class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :hot_springs, dependent: :destroy
has_many :hot_spring_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

attachment :profile_image

end
