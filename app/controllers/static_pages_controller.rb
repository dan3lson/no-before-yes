# frozen_string_literal: true

# StaticPagesController
class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def homepage
    redirect_to dashboard_path if signed_in?
  end

  def how_it_works
  end

  def pricing
  end

  def support
  end

  def about
  end

  def blog
  end
end
