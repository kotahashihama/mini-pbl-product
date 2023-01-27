class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :contributor, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 2000 }
end
