class Comment < ApplicationRecord
  belongs_to :post
  validates :contributor, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 2000 }
  validates_presence_of :post
end
