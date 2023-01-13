class Comment < ApplicationRecord
  belongs_to :post
  validates :contributor, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 2000 }
  validates :post_id, presence: true
end
