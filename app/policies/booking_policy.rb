class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.user
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    in_bookings = user.apartment_bookings
    out_bookings = user.bookings

    in_bookings.include?(record) || out_bookings.include?(record)
  end

  def destroy?
    user == record.user
  end
end
