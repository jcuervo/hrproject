class Education < ActiveRecord::Base
  belongs_to :applicant
  has_many :educations
end
