class RenamePublicToPublishedToLessons < ActiveRecord::Migration[7.2]
  def change
    rename_column :lessons, :public, :published
  end
end
