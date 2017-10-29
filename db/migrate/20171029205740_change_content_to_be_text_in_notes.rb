class ChangeContentToBeTextInNotes < ActiveRecord::Migration[5.1]
  def change
    change_column :notes, :content, :text
  end
end
