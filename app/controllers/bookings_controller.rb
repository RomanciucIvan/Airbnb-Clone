class BookingsController < ApplicationController
  before_action :set_apartment
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = @apartment.bookings
    authorize @bookings
  end

  def show
    @number_of_nights = @booking.number_of_nights
    authorize @booking
  end

  def new
    authorize @booking
    @booking = @apartment.bookings.build(start_date: Date.today, end_date: Date.today)
  end
  
  def create
    @booking = @apartment.bookings.build(booking_params)
    @booking.user = current_user
    @booking.total_price = calculate_total_price(@booking.start_date, @booking.end_date, @apartment.price)
    authorize @booking
    if @booking.save
      redirect_to apartment_booking_path(@apartment, @booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def calendar
    @bookings = @apartment.bookings
    authorize @apartment, :calendar?
  end

  private

  def calculate_total_price(start_date, end_date, price_per_day)
    (end_date - start_date).to_i * price_per_day
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def set_booking
    @booking = @apartment.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  
end

