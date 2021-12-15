class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { in: 51..200 }
  belongs_to :user
end
