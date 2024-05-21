class Apartment < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
<<<<<<< Updated upstream
=======
  has_many :reviews
  has_many :bookings
>>>>>>> Stashed changes
end
