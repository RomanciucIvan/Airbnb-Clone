class BookingsController < ApplicationController
  before_action :set_apartment, only: [:index,:show, :edit, :new, :destroy, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = @apartment.bookings
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @start_date = @booking.start_date
    @end_date = @booking.end_date
    @cleaning_fee = @booking.apartment.cleaning_fee
    @number_of_nights = @booking.number_of_nights
    authorize @booking
  end

  def new
    @cleaning_fee = @apartment.cleaning_fee || 0
    @start_date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today
    @end_date = params[:end_date] ? Date.parse(params[:end_date]) : Date.today + 1
    @total_price = calculate_total_price(@start_date, @end_date, @apartment.price)
    @booking = @apartment.bookings.build(start_date: Date.today, end_date: Date.today)
    @number_of_nights = (@end_date - @start_date).to_i
    authorize @booking

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

  def update
    authorize @booking
    if params[:variant] == "accept"
      @booking.status = :approved
    elsif params[:variant] == "decline"
      @booking.status = :declined
    elsif params[:variant] == "cancele"
      @booking.status = :canceled
    end
    @booking.save
    redirect_to user_path
  end

  
  def destroy
    authorize @booking
    @booking.destroy
    redirect_to user_path(current_user), notice: 'Booking was successfully deleted.'  end

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
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
  
end