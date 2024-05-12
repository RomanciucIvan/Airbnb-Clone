class Apartment < ApplicationRecord
  belongs_to :user
<<<<<<< Updated upstream
=======
  has_many_attached :photos
  has_many :reviews
>>>>>>> Stashed changes
end
