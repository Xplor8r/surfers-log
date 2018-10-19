require 'rack-flash'

class LogController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/log_entries' do
    if logged_in?
      @logs = Logs.all.sort_by { |log| log.date }.reverse
      erb :'/logs/log_entries'
    else
      please_log_in
    end
  end

  get '/new' do
    if logged_in?
      erb :'/logs/new_log_entry'
    else
      please_log_in
    end
  end

  get '/logs/:id/edit' do
    @log = Log.find_by_id(params[:id])
    if logged_in? && current_user.logs.include?(@log)
      erb :'/logs/edit_log_entry'
    else
      please_log_in
    end
  end

  helpers do
    def please_log_in
      flash[:message] = "You must be logged in."
      redirect to '/login'
    end

  end
end
