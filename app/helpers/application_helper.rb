module ApplicationHelper

def meta_tag_helper(a,b)
  eval(a).where(:permalink => b).map{|u,v| {:site => u.site , :title => u.title , :reverse => u.reverse ,:description => u.description ,:keywords => u.keywords}}.first
end

end
