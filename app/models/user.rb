class User < ApplicationRecord
include Visible
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence:true, length:{maximum:10}

  validates :email, presence:true, length: {minimum:1, maximum:20}, format: { with: VALID_EMAIL_REGEX, message: "is not a valid format" }
  validates :password, presence:true, length: {minimum:1, maximum:10}
end
