require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :'/index'
  end
  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
       Surfer.find(session[:user_id])
     end

     def please_log_in
       flash[:error] = "You must be logged in."
       redirect to '/login'
     end
   end
end
