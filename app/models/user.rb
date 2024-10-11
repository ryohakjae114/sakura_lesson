class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :reserved_lesson_dates, through: :reservations, source: :lesson_date

  validates :name, presence: true, length: { maximum: 200 }
end
