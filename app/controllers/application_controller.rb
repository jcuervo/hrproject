class ApplicationController < ActionController::Base
  protect_from_forgery
  include FrontendHelpers::Html5Helper
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  require 'active_admin_views_pages_base.rb'
  
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
end
