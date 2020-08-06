# frozen_string_literal: true

# StatsController
class StatsController < ApplicationController
  def index
    @stats = StatsPresenter.new(current_user)
  end
end
