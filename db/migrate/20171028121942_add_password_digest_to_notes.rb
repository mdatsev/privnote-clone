class AddPasswordDigestToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :password_digest, :string
  end
end
