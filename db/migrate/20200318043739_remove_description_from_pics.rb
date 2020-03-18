class RemoveDescriptionFromPics < ActiveRecord::Migration[6.0]
  def change

    remove_column :pics, :description, :text
  end
end
