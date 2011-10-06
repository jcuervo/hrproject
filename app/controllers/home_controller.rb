class HomeController < ApplicationController
  def index
    set_meta_tags meta_tag_helper("PageManagement","home")
  end
end
