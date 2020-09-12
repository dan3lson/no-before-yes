# frozen_string_literal: true

require 'resque-retry'

# Base job class from which all job classes should inherit.
class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
	extend Resque::Plugins::Retry

	@retry_limit = 3
  @retry_delay = 60

	@queue = :normal
end
