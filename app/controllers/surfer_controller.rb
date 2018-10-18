class SurferController < ApplicationController
  register Sinatra::Flash

  enable :sessions
  require 'sinatra/flash'
end
