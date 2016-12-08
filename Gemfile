ruby '2.2.2'

source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'rails-api', require: 'rails-api/action_controller/api'
gem 'active_model_serializers'
gem 'pg'
gem 'activeadmin', github: 'activeadmin'
gem 'multi_json'
gem 'simple_token_authentication', '~> 1.0'
gem 'devise'
gem 'omniauth'
#gem 'omniauth-linkedin'
#gem 'figaro'
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'turbolinks'

gem 'responders', '~> 2.0'

group :development, :test do
  gem 'spring'
  gem 'byebug', platform: :mri

  gem 'pry-meta'
  gem 'byebug'
  gem 'foreman'
  gem 'annotate', '~> 2.6.5'
  gem 'autotest-rails'
  gem 'dotenv-rails'
  gem 'railroady'
  gem 'listen'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'spring-commands-rspec'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rubocop',  '0.33.0'
  gem "letter_opener"
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rspec-autotest'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor', group: :production
end


