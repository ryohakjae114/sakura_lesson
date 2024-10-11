class Lesson < ApplicationRecord
  has_many :lesson_dates, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :summary, presence: true, length: { maximum: 500 }
  validates :instructor, length: { maximum: 200 }
  validates :published, inclusion: [true, false]

  scope :published, -> { where(published: true) }
end
