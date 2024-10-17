class CreateLessonDates < ActiveRecord::Migration[7.2]
  def change
    create_table :lesson_dates do |t|
      t.references :lesson, null: false, foreign_key: true
      t.date :date, null: false, default: ''
      t.time :start_time, null: false, default: ''
      t.time :end_time, null: false, default: ''
      t.integer :capacity, null: false, default: 1
      t.text :url, null: false, default: ''

      t.timestamps
    end
    add_index :lesson_dates, %i[lesson_id date], unique: true
  end
end
