class GroupsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: { message: "logged in" }
  end

  def show
  end

  def create
    @group = Group.create(
      title = params[:title]
      image_url = params[:image_url]
    )
  end
end
