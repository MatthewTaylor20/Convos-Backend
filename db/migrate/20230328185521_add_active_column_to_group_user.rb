class AddActiveColumnToGroupUser < ActiveRecord::Migration[7.0]
  def change
    add_column :group_users, :active, :boolean, default: true
  end
end
