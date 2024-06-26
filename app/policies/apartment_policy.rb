class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user_id: user.id)
    end
  end

  def show?
    true
  end
  def create?
    true
  end
  def new?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
