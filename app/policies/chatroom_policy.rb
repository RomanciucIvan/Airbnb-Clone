class ChatroomPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    # record >> chatroom
    # chatroom belongs to booking
    # booking belongs to appartment
    # booking belongs to user 
    
    booking_user = record.booking.user
    apartment_user = record.booking.apartment.user
    user == booking_user || user ==  apartment_user
  end
end
