class AddOwnerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :owner_id, :integer
  end
end
