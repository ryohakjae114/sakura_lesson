class AddReservationCountsToLessonDate < ActiveRecord::Migration[7.2]
  def change
    add_column :lesson_dates, :reservations_count, :integer, null: false, default: 0
  end
end
