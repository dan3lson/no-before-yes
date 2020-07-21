# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  def show
    @dashboard = DashboardPresenter.new(current_user)
  end
end
