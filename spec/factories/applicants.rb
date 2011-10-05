

Factory.sequence :email do |n|
  "applicant#{n}@example.com"
end

Factory.define :applicant do |f|
  f.id 1
  f.source_id 1
  f.other_source 'test'
  f.first_name 'test'
  f.middle_name 'test'
  f.last_name 'test'
  f.gender 'test'
  f.civil_status 'test'
  f.street 'test'
  f.city 'test'
  f.region 'test'
  f.zip 'test'
  f.birthdate '2011-09-29'
  f.landline 'test'
  f.mobile 'test'
  f.email { Factory.next :email}
  f.sss 'test'
  f.philhealth 'test'
  f.pagibig 'test'
  f.tin 'test'
  f.other_skills 'test'
  f.abroad_plans 'false'
  f.how_soon 'test'
  f.emergency_contact 'test'
  f.emergency_phone 'test'
  f.emergency_address 'test'
  f.date_available_for_work '2011-09-29'
  f.desired_salary_range '20000'
  f.date_of_application '2011-09-29'
  f.other_observations 'test'
end
