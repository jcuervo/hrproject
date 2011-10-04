class Qanda < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :question
end
