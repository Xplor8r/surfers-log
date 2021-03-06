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
    if Surfer.exists?(surfername: params[:surfername], email: params[:email])
      flash[:error] = "That Surfer already exists. Please log in."
      redirect to '/login'
    end
    @surfer = Surfer.new(surfername: params[:surfername], email: params[:email], password: params[:password])
    if params[:surfername] != "" && params[:password] != "" && params[:email] != ""
      @surfer.save
      session[:user_id] = @surfer.id
      flash[:message] = "Signup Successfull!"
      redirect to "/log_entries"
    else
      flash[:error] = "You must enter valid Surfer name, Email, and Password to sign up."
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
      flash[:error] = "Your email or password was incorrect or this surfer does not exist yet."
      redirect to '/login'
    end
  end

  get '/surfers/:slug' do
    @surfer = Surfer.find_by_slug(params[:slug])
    erb :'/surfers/show'
  end

    get '/logs/:slug/all' do
      @surfer = Surfer.find_by_slug(params[:slug])
      erb :'/surfers/show'
    end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end
end
