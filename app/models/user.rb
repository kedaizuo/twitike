class User < ApplicationRecord
include Visible
  has_many :posts, dependent: :destroy

  validates :username, presence:true, length:{maximum:10}
  validates :email, presence:true, length: {minimum:1, maximum:20}
  validates :password, presence:true, length: {minimum:1, maximum:10}
end
