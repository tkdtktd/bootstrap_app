class ChangeAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    if Rails.env.production?
      remove_column :users, :avatar, :string
      add_column :users, :avatar, :json
    end
  end
end
