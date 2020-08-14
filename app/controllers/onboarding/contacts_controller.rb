# frozen_string_literal: true

module Onboarding
  # ContactsController
  class ContactsController < ApplicationController
    def create
      @contact = current_user.contacts.new(contact_params)

      @saved = @contact.save
      current_user.onboarding_touchpoints! if @saved
    end

    private

    def contact_params
      params.
        require(:contact).
        permit(:name, :website, :email, :phone_number, :note, :user_id).
        reject { |_key, value| value.blank? }
    end
  end
end
