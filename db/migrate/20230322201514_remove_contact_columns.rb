class RemoveContactColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column(:contacts, :first_name)
    remove_column(:contacts, :last_name)
    remove_column(:contacts, :email)
    remove_column(:contacts, :phone_number)
    add_column(:contacts, :owner_id, :integer)
  end
end
