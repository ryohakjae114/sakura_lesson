class AddReservationCountsToLessonDate < ActiveRecord::Migration[7.2]
  def change
    add_column :lesson_dates, :reservation_counts, :integer
  end
end
