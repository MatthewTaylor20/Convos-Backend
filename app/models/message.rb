class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  def create_timestamp
    created_at.strftime("%d %B %Y %H:%M:%S %z")
  end

  def update_timestamp
    updated_at.strftime("%d %B %Y %H:%M:%S %z")
  end
end
