require 'rack-flash'
class LogEntriesController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/log_entries' do
    if logged_in?
      @log_entries = LogEntry.all.sort_by { |log| log.date }.reverse
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

  post '/log_entries' do
    if logged_in? && params['surf_spot'] != "" && params['date'] != ""  && params['content'] != ""
      @log_entry = current_user.log_entries.create(surf_spot: params['surf_spot'], date: params['date'], content: params['content'])
      if @log_entry
        if params['swell_direction'] != ""
          @log_entry.swell_direction == params['swell_direction']
        end
        if params['swell_size'] != ""
          @log_entry.swell_size == params['swell_size']
        end
        if params['conditions'] != ""
          @log_entry.conditions == params['conditions']
        elsif params['swell_size'] != ""
          @log_entry.swell_size == params['swell_size']
        elsif params['wave_count'] != ""
          @log_entry.wave_count == params['wave_count']
        elsif params['image_url'] != ""
          @log_entry.image_url == params['image_url']
        end
        @log_entry.save
        redirect to "/logs/#{@log_entry.id}"
      else
        flash[:message] = "Please enter Surf Spot Name, Date of Session, and Log Entry Content."
        redirect to '/logs/new_log_entry'
      end
    else
      please_log_in
    end
    current_user.save
  end

  get '/logs/:id' do
    if logged_in?
      @log_entry = LogEntry.find_by_id(params[:id])
      erb :'/logs/show_log_entry'
    else
      please_log_in
    end
  end

  get '/logs/:id/edit' do
    @log_entry = LogEntry.find_by_id(params[:id])
    if logged_in? && current_user.log_entries.include?(@log_entry)
      erb :'/logs/edit_log_entry'
    else
      please_log_in
    end
  end

end
