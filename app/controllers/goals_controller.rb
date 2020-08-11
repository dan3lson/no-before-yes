# frozen_string_literal: true

# GoalsController
class GoalsController < ApplicationController
  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      flash[:success] = 'Goal was successfully saved.'

      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:target)
  end
end
