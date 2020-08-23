# frozen_string_literal: true

# BillingController
class BillingController < ApplicationController
  def show
    @free_trial_expires_at = current_user.free_trial_expires_at
  end
end
