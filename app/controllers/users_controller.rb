class UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    p params[:password_confirmation]
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
      p user.errors.full_messages
    end
  end

  def update
    user = User.find_by(id: params[:id])
    p user.id
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      image_url: params[:image_url],
    )
    render json: {
      email: user.email,
      phone_number: user.phone_number,
      user_image_url: user.image_url,
      first_name: user.first_name,
      last_name: user.last_name,
    }
  end
end
