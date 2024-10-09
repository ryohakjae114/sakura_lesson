class Lesson < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :summary, presence: true, length: { maximum: 500 }
  validates :maximum_allowed, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :instructor, length: { maximum: 200 }
  validates :public, inclusion: [true, false]
end
