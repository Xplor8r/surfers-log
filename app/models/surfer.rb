class Surfer < ActiveRecord::Base
  has_secure_password
  has_many :log_entries

  def slug
    self.surfername.downcase.gsub(" ", "-")
  end
  def self.find_by_slug(slug)
    self.all.find{|surfername| surfername.slug == slug}
  end
end
