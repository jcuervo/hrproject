ActiveAdmin.register AdminUser do
  show :title => :email do
    attributes_table :email, :created_at
  end
  
  index do
    column :email do |admin_user|
      link_to admin_user.email, admin_admin_user_path(admin_user)
    end
  end
end
