class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
  validates :title, length: { maximum: 100 }
  # validates :comment, presence: true, length: { maximum: 2000 }
end
