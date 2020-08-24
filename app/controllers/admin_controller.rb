# frozen_string_literal: true

# AdminController
class AdminController < ApplicationController
  def insights
    authorize :admin, :insights?
  end

  def kpis
    authorize :admin, :kpis?

    show_by = params[:show_by]
    @group_by = show_by.present? ? "group_by_#{show_by}" : :group_by_day
  end

  private

  def kpi_params
    params.permit(:show_by)
  end
end
