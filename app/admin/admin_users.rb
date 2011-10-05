ActiveAdmin.register AdminUser do
  controller.authorize_resource

  menu :if => lambda{|tabs_renderer|
    controller.current_ability.can?(:manage, AdminUser)
  }
  
  filter :email
  
  show :title => :email do
    attributes_table :email, :created_at
  end
  
  index do
    column :email do |admin_user|
      link_to admin_user.email, admin_admin_user_path(admin_user)
    end
    if can? :manage, AdminUser
      column :role
    end
  end

  controller do
    def scoped_collection
      end_of_association_chain.accessible_by(current_ability)
    end
  end
  
end
