require 'rack-flash'
class SurferController < ApplicationController
  use Rack::Flash

  enable :sessions
end
