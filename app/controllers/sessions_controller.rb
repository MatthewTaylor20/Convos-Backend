class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt,
                email: user.email,
                user_id: user.id,
                user_image_url: user.image_url,
                first_name: user.first_name,
                last_name: user.last_name },
        status: :created
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
