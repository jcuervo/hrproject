class PageManagement < ActiveRecord::Base
  def self.metaget(a = "home")
    PageManagement.where(:permalink => a).map{|u,v| {:site => u.site , :title => u.title , :reverse => u.reverse ,:description => u.description ,:keywords => u.keywords}}.first
  end
end