require 'rack-flash'

class LogController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/log_entries' do
    erb :'/logs/log_entries'
  end

  get '/new' do
    erb :'/logs/new_log_entry'
  end

  get '/logs/:id/edit' do
    erb :'/logs/edit_log_entry'
  end


end
