require 'rack-flash'
class LogEntriesController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/log_entries' do
    if logged_in?
      @logs = LogEntry.all.sort_by { |log| log.date }.reverse
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
    @log = LogEntry.find_by_id(params[:id])
    if logged_in? && current_user.logs.include?(@log)
      erb :'/logs/edit_log_entry'
    else
      please_log_in
    end
  end

end
