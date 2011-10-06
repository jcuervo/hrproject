class Education < ActiveRecord::Base
  belongs_to :applicant
  has_many :educations

  validates :applicant, :presence => true
end
