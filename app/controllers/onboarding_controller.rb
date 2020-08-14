# frozen_string_literal: true

# OnboardingController
class OnboardingController < ApplicationController
  layout 'application_onboarding'

  def index; end

  def update
    @step = params[:step]
    @contact = Contact.new if @step == 'contacts'
    onboarding_enum = "onboarding_#{@step}!"

    current_user.send(onboarding_enum)
  end
end
