class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  validates :title, length: { maximum: 100 }
end
