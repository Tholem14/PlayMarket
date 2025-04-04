class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
