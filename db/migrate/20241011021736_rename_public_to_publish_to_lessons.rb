class RenamePublicToPublishToLessons < ActiveRecord::Migration[7.2]
  def change
    rename_column :lessons, :public, :publish
  end
end
