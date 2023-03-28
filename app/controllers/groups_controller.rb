class GroupsController < ApplicationController
  before_action :authenticate_user

  def index
    groups = current_user.groups
    @groups = []
    groups.each do |group|
      current_group_user = GroupUser.find_by(group_id: group.id, user_id: current_user.id)
      if current_group_user.active
        @groups << group
      end
    end
    render :index
  end

  def show
  end

  def create
    recipients = params[:recipients].split(",")
    p recipients
    @group = Group.create()
    recipients.each do |recipient|
      GroupUser.create(
        group_id: @group.id,
        user_id: recipient.to_i,
      )
    end
    GroupUser.create(
      group_id: @group.id,
      user_id: current_user.id,
    )

    render json: { message: "Group successfully created", group_id: @group.id }
  end

  def destroy
    group = Group.find_by(id: params[:id])
    active_group_users = GroupUser.where(group_id: group.id, active: true)
    p active_group_users
    if active_group_users.length < 2
      group_users = GroupUser.where(group_id: group.id)
      messages = Message.where(group_id: group.id)
      group_users.each do |group_user|
        group_user.destroy
      end
      messages.each do |message|
        message.destroy
      end
      group.destroy
      render json: { message: "Group, Messages, and GroupUsers successfully destroyed" }
    else
      group_user = GroupUser.find_by(group_id: group.id, user_id: current_user.id)
      group_user.update(
        active: false,
      )
      render json: { message: "User successfully left the group" }
    end
  end
end
