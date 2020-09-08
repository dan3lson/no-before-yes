# frozen_string_literal: true

require 'resque-retry'

class YourWeekAtAGlance
	extend Resque::Plugins::Retry

	@queue = :normal

	@retry_limit = 3
  @retry_delay = 60

	def self.perform; end
end
