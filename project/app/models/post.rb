class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
  validates :title, length: { maximum: 100 }
end
