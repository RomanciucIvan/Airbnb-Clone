class ChatroomsController < ApplicationController
  before_action :set_booking, only: [:create]

  # def new
  #   @chatroom = @booking.chatrooms.build
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def index
    @chatrooms = policy_scope(Chatroom)
  end

  # def create
  #   name = @booking.apartment.title
  #   @chatroom = Chatroom.new(name: name, booking: @booking)
  #   # @booking.chatrooms.build(name: name)
  #   # @chatroom.user = current_user
  #   authorize @chatroom

  #   if @chatroom.save!
  #     redirect_to booking_chatroom_path(@booking, @chatroom), notice: 'Chat was successfully created.'
  #   # else
  #     # render :new
  #   end
  # end

  def create
    @booking = Booking.find(params[:booking_id])
    @chatroom = @booking.chatrooms.first_or_create
    authorize @chatroom

    if @chatroom.save!
    redirect_to booking_chatroom_path(@booking, @chatroom), notice: 'Chat was successfully created.'
  end
end
  
  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :content, :user_id)
  end
end
