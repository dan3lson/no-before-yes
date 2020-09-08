source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'ahoy_matey'
gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 4.5.0'
gem 'chartkick'
gem 'clearance'
gem 'faker'
gem 'groupdate'
gem 'newrelic_rpm'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'pundit'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'redis', '~> 4.0'
gem 'resque'
gem 'resque-pause'
gem 'resque-pool'
gem 'resque-retry'
gem 'resque-scheduler'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rspec-rails', '~> 3.9.0'
  # Master branch used for specs which include methods like 'optional' and 'with_values'
  gem 'shoulda-matchers',
      git: 'https://github.com/thoughtbot/shoulda-matchers.git',
      branch: 'master'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
