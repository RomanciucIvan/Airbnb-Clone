class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user && user.is_admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def index?
    true
  end
end
