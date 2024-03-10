class Prototype < ApplicationRecord
  belong_to :user
  has_many :comments
  has_one_attached :image
end
