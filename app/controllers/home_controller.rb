class HomeController < ApplicationController
  def index
    set_meta_tags PageManagement.metaget("home")
  end
end
