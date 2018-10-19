require 'rack-flash'
class SurferController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/create_surfer' do
    erb :'/surfers/create_surfer'
  end

  get '/login' do
    erb :'/surfers/login'
  end

  get '/show' do
    erb :'/surfers/show'
  end

  get '/logout' do
    redirect to '/login'
  end


end
