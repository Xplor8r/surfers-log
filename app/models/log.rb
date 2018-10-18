class Log < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  belongs_to :surfer
end
