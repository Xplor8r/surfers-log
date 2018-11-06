require 'rack-flash'
class LogEntriesController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/log_entries' do
    if logged_in?
      @log_entries = LogEntry.all.reverse
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
    if !logged_in?
      please_log_in
    elsif logged_in? && params['surf_spot'] != "" && params['date'] != ""  && params['content'] != ""
      @log_entry = current_user.log_entries.create(surf_spot: params['surf_spot'], date: params['date'], content: params['content'], swell_direction: params['swell_direction'], conditions: params['conditions'], swell_size: params['swell_size'], wave_count: params['wave_count'], image_url: params['image_url'])
      flash[:message] = "Log Entry Succesfully Created."
      redirect to "/logs/#{@log_entry.id}"
    else
      flash[:error] = "Please enter Surf Spot Name, Date of Surf Session, and Log Entry Content."
      redirect to '/new'
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
    elsif logged_in? && @log_entry == nil
      flash[:error] = "Sorry, That Log Entry Has Been Deleted."
      redirect to '/log_entries'
    else
      please_log_in
    end
  end

  patch '/logs/:id' do
    @log_entry = LogEntry.find_by_id(params[:id])
    if !logged_in? 
      please_log_in
    elsif params['surf_spot'] != "" && params['date'] != "" && params['content'] != "" && current_user.log_entries.include?(@log_entry)
          
      @log_entry.update(surf_spot: params['surf_spot'], date: params['date'], content: params['content'], swell_direction: params['swell_direction'], conditions: params['conditions'], swell_size: params['swell_size'], wave_count: params['wave_count'], image_url: params['image_url'])
      flash[:message] = "Log Entry Succesfully Edited."
      redirect to "/logs/#{@log_entry.id}"
    elsif params['surf_spot'] == "" || params['date'] == "" || params['content'] == ""
      flash[:error] = "Please enter Surf Spot Name, Date of Surf Session, and Log Entry Content."
      redirect to "/logs/#{@log_entry.id}/edit"
    elsif !current_user.log_entries.include?(@log_entry)
      flash[:error] = "Sorry, you can only edit your own Log Entries."
      redirect to "/logs/#{@log_entry.id}" 
    end
  end

  delete '/logs/:id/delete' do
    @log_entry = LogEntry.find_by_id(params[:id])
    if logged_in? && @log_entry.surfer == current_user
      @log_entry.delete
    else
      please_log_in
    end
    flash[:message] = "Log Entry Succesfully Deleted."
    redirect to '/log_entries'
  end
end
