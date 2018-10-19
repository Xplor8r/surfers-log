require 'rack-flash'
class SurferController < ApplicationController
  use Rack::Flash

  enable :sessions
  require 'sinatra/flash'
end
