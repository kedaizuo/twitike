class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :commenter, presence:true
  validates :content, presence:true
end
