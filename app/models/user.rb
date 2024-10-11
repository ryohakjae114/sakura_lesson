class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 200 }
end
