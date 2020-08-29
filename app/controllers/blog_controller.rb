# frozen_string_literal: true

# BlogController
class BlogController < ApplicationController
  skip_before_action :require_login

  def index; end

  def august_28_nothing_seemed_to_change; end
end
