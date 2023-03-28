class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts

    render :index
  end

  def find
    @contact = User.find_by(email: params[:search])
    p params[:search]
    if @contact == nil
      @contact = User.find_by(phone_number: params[:search])
    end
    if @contact == nil
      render json: { error: "We could not find a user with that information. " }
    else
      render :show
    end
  end

  def create
    @contact = Contact.create(
      owner_id: params[:owner_id],
      user_id: params[:user_id],
    )
    render json: {
      owner_id: @contact.owner_id,
      user_id: @contact.user_id,
    }
  end
end
