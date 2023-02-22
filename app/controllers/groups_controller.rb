class GroupsController < ApplicationController
  before_action :authenticate_user

  def index
    @groups = current_user.groups
    # render json: { message: "Neato" }
    render :index
  end

  def show
  end

  def create
    @group = Group.create(
      title: params[:title],
    )
    render json: {
      message: "Group successfully created",
      group_id: @group.id,
    }
  end
end
