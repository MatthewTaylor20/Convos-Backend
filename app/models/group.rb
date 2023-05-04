class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  def most_recent_message
    message = messages.last
    if message.notification
      message = messages[-2]
    end
    message
  end

  def name
    if title
      return title
    else
      name = ""
      users.each do |user|
        name = name + user.first_name + " " + user.last_name + ", "
      end
      name.delete_suffix(", ")
      return name
    end
  end

  def image
    group_users = users
    if group_users.length < 3
      return group_users[0].image_url
    end
  end
end
