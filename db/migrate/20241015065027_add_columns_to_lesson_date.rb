class AddColumnsToLessonDate < ActiveRecord::Migration[7.2]
  def change
    add_column :lesson_dates, :start_at, :datetime
    add_column :lesson_dates, :end_at, :datetime
  end
end
