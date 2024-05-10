class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :apartments
  # def admin?
  #   # Возвращает true, если пользователь является администратором, и false в противном случае
  #   # Например, если у вас есть атрибут is_admin в таблице пользователей:
  #   is_admin
  # end
end