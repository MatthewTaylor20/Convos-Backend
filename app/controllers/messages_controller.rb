class MessagesController < ApplicationController
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
    render json: { message: "Message successfully created" }
  end
end
