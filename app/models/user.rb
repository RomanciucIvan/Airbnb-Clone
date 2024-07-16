class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :apartments
  has_many :bookings

  def apartment_bookings
    Booking.joins(apartment: :user).where(users: { id: self.id })
  end
end