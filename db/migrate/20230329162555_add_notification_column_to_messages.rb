class AddNotificationColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :notification, :boolean, default: false
  end
end
