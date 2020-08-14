# frozen_string_literal: true

# OnboardingController
class OnboardingController < ApplicationController
  before_action :redirect_to_dashboard?

  layout 'application_onboarding'

  def index; end

  def update
    @step = params[:step]
    @contact = Contact.new if @step == 'contacts'
    onboarding_enum = "onboarding_#{@step}!"

    current_user.send(onboarding_enum)
  end

  private

  def redirect_to_dashboard?
    return unless current_user.onboarding_finish?

    redirect_to dashboard_path(onboarding_finished: true)
  end
end
