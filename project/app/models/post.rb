class Post < ApplicationRecord
  validates :title, length: { maximum: 100 }
  validates :detail, presence: true, length: { maximum: 1000 }
end
