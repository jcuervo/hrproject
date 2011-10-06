ActiveAdmin.register WorkExperience do
  belongs_to :applicant  
  menu :parent => "Applicants"
end
