class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  #  :recoverable
end
