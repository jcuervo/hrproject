

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
end

#educations

Factory.define :education do |e|
  e.school_name "school2 test"
  e.years_attended "1900-2000"
  e.course "test"
  e.association :applicant
end

#work experiences

Factory.define :applicant_with_work_experiences, :parent => :applicant do |a|
  a.after_build do |b|
    b.work_experiences = [Factory.build(:work_experience, :applicant => b), Factory.build(:work_experience, :applicant => b)]
  end
end

Factory.define :work_experience do |f|
  f.employer "test"
  f.address "test"
  f.supervisor "test"
  f.supervisor_contact "test"
  f.can_contact "false"
  f.job_title "test"
  f.employed_from "9-06-2011"
  f.employed_to "9-06-2011"
  f.salary_range "1100-2000"
  f.responsibilities "test"
  f.reason_for_leaving "test"
end

Factory.define(:work_experience_with_applicant, :parent => :applicant) do |a|
  a.association(:applicant)
end

#families

Factory.define :applicant_with_families, :parent => :applicant do |a|
  a.after_build do |b|
    b.families = [Factory.build(:family, :applicant => b), Factory.build(:family, :applicant => b)]
  end
end

Factory.define :family do |f|
  f.relationship "test"
  f.name "test"
  f.age "10"
  f.occupation "test"
end

Factory.define(:family_with_applicant, :parent => :applicant) do |a|
  a.association(:applicant)
end


