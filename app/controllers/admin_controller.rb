# frozen_string_literal: true

# AdminController
class AdminController < ApplicationController
  def insights
    authorize :admin, :insights?
  end

  def kpis
    authorize :admin, :kpis?
  end
end
