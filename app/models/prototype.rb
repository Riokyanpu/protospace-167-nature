class Prototype < ApplicationRecord
  belong_to :user
  has_many :comments
end
