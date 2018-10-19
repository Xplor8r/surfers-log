require 'rack-flash'
class SurfersController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/create_surfer' do
    if logged_in?
      redirect to '/log_entries'
    else
      erb :'/surfers/create_surfer'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/log_entries'
    else
      erb :'/surfers/login'
    end
  end

  post '/signup' do
    @surfer = Surfer.new(surfername: params[:surfername], email: params[:email], password: params[:password])
    if params[:surfername] != "" && params[:password] != "" && params[:email] != ""
      @surfer.save
      session[:user_id] = @surfer.id
      flash[:message] = "Signup Successfull!"
      redirect to "/log_entries"
    else
      flash[:message] = "You must enter valid surfername, email, and password to sign up."
      redirect to "/create_surfer"
    end
  end

  post '/login' do
    @surfer = Surfer.find_by(surfername: params[:surfername])
    if @surfer && @surfer.authenticate(params[:password])
      session[:user_id] = @surfer.id
      flash[:message] = "Login Successfull!"
      redirect to "/log_entries"
    else
      flash[:message] = "This surfer does not exist yet. Please sign up."
      redirect to '/create_surfer'
    end
  end

  get '/surfers/:slug' do
    @surfer = Surfer.find_by_slug(params[:slug])
    erb :'/surfers/show'
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
