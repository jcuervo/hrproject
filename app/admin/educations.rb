ActiveAdmin.register Education do
  belongs_to :applicant
  belongs_to :education 
  
  menu :parent => "Applicants"
end
