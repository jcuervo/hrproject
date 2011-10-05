class Applicant < ActiveRecord::Base
  belongs_to :source
  has_many :educations
  has_many :work_experiences
  has_many :pending_applications
  has_many :families
  has_many :references
  has_many :questions, :through => :qanda

  accepts_nested_attributes_for :educations, :allow_destroy => true
  accepts_nested_attributes_for :work_experiences, :allow_destroy => true
  accepts_nested_attributes_for :families, :allow_destroy => true
  accepts_nested_attributes_for :references, :allow_destroy => true

  validates :first_name, :middle_name, :last_name, :gender, :civil_status, :street, :city, :region, :zip,
            :birthdate, :landline, :mobile, :email, :date_available_for_work, :desired_salary_range, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

end
