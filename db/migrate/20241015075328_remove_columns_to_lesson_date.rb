class RemoveColumnsToLessonDate < ActiveRecord::Migration[7.2]
  def change
    remove_column :lesson_dates, :start_time, :datetime
    remove_column :lesson_dates, :end_time, :datetime
    remove_column :lesson_dates, :date, :datetime
  end
end
