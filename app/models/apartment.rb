class Apartment < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def set_defaults
    self.cleaning_fee ||= 0
  end
end
