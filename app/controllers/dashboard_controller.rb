# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  def show
    @onboarding_finished = params[:onboarding_finished]
    @dashboard = DashboardPresenter.new(current_user)
  end
end
