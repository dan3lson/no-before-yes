# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  before_action :set_onboarding_finished

  def show
    @dashboard = DashboardPresenter.new(current_user)
  end

  private

  def set_onboarding_finished
    finished_params = dashboard_params[:onboarding_finished] &&
      dashboard_params[:onboarding_finished] == 'true'

    @onboarding_finished = finished_params && current_user.onboarding_finish?
  end

  def dashboard_params
    params.permit(:onboarding_finished)
  end
end
