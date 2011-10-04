class InterviewRating < ActiveRecord::Base
belongs_to :interview_dimention
belongs_to :applicant
belongs_to :admin_user
end
