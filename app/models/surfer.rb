class Surfer < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  has_many :logs
end
