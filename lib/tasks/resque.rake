# frozen_string_literal: true

require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment do
	require 'resque'
	require 'resque-scheduler'

  ENV['QUEUES'] = '*'
end

task :setup_schedule => :setup do
end

task :scheduler => :setup_schedule
