class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.user || user == record.apartment.user
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
    user == record.user || user == record.apartment.user
  end

  def destroy?
    user == record.user || user == record.apartment.user
  end
end
