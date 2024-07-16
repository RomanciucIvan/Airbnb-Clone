class UserController < ApplicationController
  def show
    @user = current_user
    @apartments = @user.apartments
    @in_bookings = @user.apartment_bookings.order('created_at ASC')
    @out_bookings = @user.bookings
    authorize @user
  end
end
