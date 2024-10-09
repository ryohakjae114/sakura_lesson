class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.string :title, null: false, default: '', limit: 50
      t.text :summary, null: false, default: ''
      t.integer :maximum_allowed, null: false, default: 1
      t.string :instructor, null: false, default: '', limit: 200
      t.boolean :public, null: false, default: false

      t.timestamps
    end
  end
end
