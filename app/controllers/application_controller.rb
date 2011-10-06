class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path, :alert => exception.message
  end
  
  require 'active_admin_views_pages_base.rb'
  
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
end
