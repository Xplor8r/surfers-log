require 'rack-flash'

class LogController < ApplicationController
  use Rack::Flash
end
