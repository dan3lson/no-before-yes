# frozen_string_literal: true

module Contacts
  # TouchpointsController
  class TouchpointsController < ApplicationController
    before_action :set_contact

    def new
      @touchpoint = current_user.touchpoints.new(contact: @contact)
    end

    def create
      @touchpoint = current_user.touchpoints.new(touchpoint_params)
      @touchpoint.contact = @contact

      if @touchpoint.save
        flash[:success] = 'Touchpoint was successfully created.'

        redirect_to @contact
      else
        render :new
      end
    end

    private

    def set_contact
      @contact = current_user.contacts.find(params[:contact_id])
    end

    def touchpoint_params
      params.require(:touchpoint).permit(:recap, :follow_up_on, :source, :result)
    end
  end
end
