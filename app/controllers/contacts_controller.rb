class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts.by_name
  end

  def show
    @touchpoints = @contact.touchpoints.latest
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      flash[:success] = 'Contact was successfully created.'

      redirect_to contacts_path
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = 'Contact was successfully updated.'

      redirect_to @contact
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy

    if @contact.destroyed?
      flash[:success] = 'Contact was successfully destroyed.'

      redirect_to contacts_url
    else
      flash[:danger] = 'Contact was not destroyed (check association restrictions?).'

      redirect_to contacts_url
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.
      require(:contact).
      permit(:name, :website, :email, :phone_number, :note, :user_id).
      reject { |_key, value| value.blank? }
  end
end
