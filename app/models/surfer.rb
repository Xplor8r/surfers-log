class Surfer < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  has_secure_password
  has_many :logs
end
