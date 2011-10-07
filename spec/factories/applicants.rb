

Factory.sequence :email do |n|
  "applicant#{n}@example.com"
end

Factory.define :applicant do |a|
  a.id 1
  a.source_id 1
  a.other_source 'test'
  a.first_name 'test'
  a.middle_name 'test'
  a.last_name 'test'
  a.gender 'test'
  a.civil_status 'test'
  a.street 'test'
  a.city 'test'
  a.region 'test'
  a.zip 'test'
  a.birthdate '2011-09-29'
  a.landline 'test'
  a.mobile 'test'
  a.email { Factory.next :email}
  a.sss 'test'
  a.philhealth 'test'
  a.pagibig 'test'
  a.tin 'test'
  a.other_skills 'test'
  a.abroad_plans 'false'
  a.how_soon 'test'
  a.emergency_contact 'test'
  a.emergency_phone 'test'
  a.emergency_address 'test'
  a.date_available_for_work '2011-09-29'
  a.desired_salary_range '20000'
  a.date_of_application '2011-09-29'
  a.other_observations 'test'
  a.educations_attributes [{:school_name => "school test", :years_attended => "1900-2000", :course => "test"},{:school_name => "school test", :years_attended => "1900-2000", :course => "test"}]
  a.work_experiences_attributes [{:employer => "employer test", :address => "test", :supervisor => "test"},{:employer => "employer test", :address => "test", :supervisor => "test"}]
  a.families_attributes [{:relationship => "relationship test", :name => "test", :age => "test", :occupation => "test"},{:relationship => "relationship test", :name => "test", :age => "test", :occupation => "test"}]
  a.references_attributes [{:name => "test", :address => "test", :contact => "test", :occupation => "test"},{:name => "test", :address => "test", :contact => "test", :occupation => "test"}]
end

#educations

Factory.define :education do |e|
  e.school_name "school2 test"
  e.years_attended "1900-2000"
  e.course "test"
  e.association :applicant
end

#work experiences

Factory.define :work_experience do |e|
  e.employer "employer2 test"
  e.address "test"
  e.supervisor "test"
  e.supervisor_contact "test"
  e.can_contact "false"
  e.job_title "test"
  e.employed_from "9-7-2011"
  e.employed_to "9-7-2011"
  e.salary_range "1100-2000"
  e.responsibilities "test"
  e.reason_for_leaving "test"
  e.association :applicant
end

#pending applications

Factory.define :applicant_with_pending_applications, :parent => :applicant do |a|
  a.after_build do |b|
    b.pending_applications = [Factory.build(:pending_application, :applicant => b), Factory.build(:pending_application, :applicant => b)]
  end
end

Factory.define :pending_application do |f|
  f.name "test"
  f.salary "2000"
  f.other_info "test"
end

Factory.define(:pending_application_with_applicant, :parent => :applicant) do |a|
  a.association(:applicant)
end

#families

Factory.define :family do |e|
  e.relationship "relationship2 test"
  e.name "test"
  e.age 12
  e.association :applicant
end

#references

Factory.define :reference do |e|
  e.name "test 2"
  e.address "test"
  e.contact "test"
  e.occupation "test"
  e.association :applicant
end

#questions

Factory.define(:question) do |q|
  q.question     "test"
end

Factory.define(:qanda) do |qnd|
  qnd.association :question
  qnd.association :applicant
end