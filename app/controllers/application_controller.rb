require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      register Sinatra::Flash
      enable :sessions
      set :session_secret, "password_security"
    end

    get '/' do
      erb :index
    end

    helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])
      end
    end

  end
