class Apartment < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews
  has_many :bookings

  after_initialize :set_defaults

  def set_defaults
    self.cleaning_fee ||= 0
  end
end
