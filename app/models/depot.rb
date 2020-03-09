class Depot < ActiveRecord::Base
  has_many :trailers
  has_many :workers
  # has_many :end_depot
  # has_many :start_depot

  def branch
    "#{self.name} #{self.location}"
  end
  def slug
    self.branch.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    self.all.find{|object| object.slug == slug}
  end
end