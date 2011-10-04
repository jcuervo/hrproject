ActiveAdmin.register Applicant do  
  # menu :parent => "Applicants"
  
  filter :first_name
  filter :last_name
  
  form :partial => "form"
  
  index do
    column :first_name
    column :last_name
    
    # if can? :manage, Page
      default_actions
    # end
  end
  
  collection_action :import_csv, :method => :post do
    # Do some CSV importing work here...
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end
end
