class DeleteDuplicatedIndexFromColumns < ActiveRecord::Migration[7.2]
  def change
    remove_index :reservations, column: :user_id
    remove_index :survey_answers, column: :user_id
  end
end
