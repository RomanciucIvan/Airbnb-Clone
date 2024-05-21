class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user

  enum :status, { pending: 0, approved: 1, declined: 2, canceled: 3 }

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price)
  end

  def number_of_nights
    (end_date - start_date).to_i
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end

