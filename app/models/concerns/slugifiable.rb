module Slugify
  module ClassMethods
    def slug
      self.surfername.downcase.gsub(" ", "-")
    end
    def find_by_slug(slug)
      self.all.find{|surfername| surfername.slug == slug}
    end
  end
end
