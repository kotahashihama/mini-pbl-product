class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  #  :recoverable

  has_many :comments, dependent: :destroy
end
