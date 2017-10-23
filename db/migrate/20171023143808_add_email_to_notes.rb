class AddEmailToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :email, :string
  end
end
