class AddProToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pro, :boolean, default: false
  end
end
