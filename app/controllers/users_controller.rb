class UsersController < ApplicationController
  def create
    p "we got here"
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
end
