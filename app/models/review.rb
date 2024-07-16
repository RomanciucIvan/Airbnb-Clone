class Review < ApplicationRecord
  belongs_to :apartment
  belongs_to :user

  validates :content, presence: true, length: { minimum: 1 }
end