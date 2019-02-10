source 'http://rubygems.org'

gem 'sinatra', '~> 2.0.2'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'

gem 'thin'
gem 'rack_session_access'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'

group :test do
  gem 'sqlite3'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end