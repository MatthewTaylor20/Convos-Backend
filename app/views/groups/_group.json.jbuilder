json.id group.id
json.title group.title
json.image_url group.image_url
json.message do
  json.id group.most_recent_message.id
  json.body group.most_recent_message.body
  json.group_id group.most_recent_message.group_id
  json.user_id group.most_recent_message.user_id
  json.first_name group.most_recent_message.user.first_name
  json.last_name group.most_recent_message.user.last_name
  json.created_at group.most_recent_message.create_timestamp
  json.updated_at group.most_recent_message.update_timestamp
end
