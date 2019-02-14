source 'http://rubygems.org'

ruby '2.5.3'

gem 'sinatra', '~> 2.0.2'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
#gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'rack_session_access'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'

group :test do
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

#group :production do
 # gem "puma"
#end

gem 'pg', :group => :production
gem 'sqlite3', :group => :development