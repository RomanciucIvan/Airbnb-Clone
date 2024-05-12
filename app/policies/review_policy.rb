# app/policies/review_policy.rb
class ReviewPolicy < ApplicationPolicy
  def create?
    # Разрешить создание отзыва только зарегистрированным пользователям
    user.present?
  end

  def update?
    # Разрешить обновление отзыва только его владельцу
    user == record.user
  end

  # def destroy?
  #   user.admin? || record.user == user
  # end

  def destroy?
    # Разрешить удаление отзыва только его владельцу
    user == record.user
  end
end
