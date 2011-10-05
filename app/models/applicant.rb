class Applicant < ActiveRecord::Base
  belongs_to :source
  has_many :educations
  has_many :work_experiences
  has_many :pending_applications
  has_many :families
  has_many :questions, :through => :qanda
  has_many :next_actions
  has_many :interview_ratings
  accepts_nested_attributes_for :educations, :allow_destroy => true

  #validates :first_name, :middle_name, :last_name, :presence => true
  #validates :email, :uniqueness => true
  #validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  attr_accessible :first_name, :middle_name, :last_name
  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[personal_info education]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end
end

