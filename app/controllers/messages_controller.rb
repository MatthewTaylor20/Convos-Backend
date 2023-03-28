require "pusher"

class MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @messages = Message.where(group_id: params[:group_id])
    @current_user_ = current_user

    render :index
  end

  def create
    @message = Message.create(
      user_id: current_user.id,
      group_id: params[:group_id],
      body: params[:body],
    )
    @group = Group.find_by(id: @message.group_id)
    render "groups/show"
    Pusher.trigger("channel_#{params[:group_id]}.convos", "new-message", {
      id: @message.id,
      user_id: @message.user_id,
      sender_image: @message.user.image_url,
      group_id: @message.group_id,
      body: @message.body,
      created_at: @message.create_timestamp,
    })
    group = Group.find_by(id: @message.group_id)
    group.users.each do |user|
      Pusher.trigger("channel_user#{user.id}.convos", "new-message", {
        id: @message.id,
        user_id: @message.user_id,
        sender_image: @message.user.image_url,
        group_id: @message.group_id,
        body: @message.body,
        created_at: @message.create_timestamp,
      })
    end
  end
end
