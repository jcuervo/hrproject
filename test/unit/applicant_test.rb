require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :applicants
  test "applicant attributes must not be empty" do
    applicant = Applicant.new
    assert applicant.invalid?
    assert applicant.errors[:first_name].any?
    assert applicant.errors[:middle_name].any?
    assert applicant.errors[:last_name].any?
    assert applicant.errors[:gender].any?
    assert applicant.errors[:civil_status].any?
    assert applicant.errors[:street].any?
    assert applicant.errors[:city].any?
    assert applicant.errors[:region].any?
    assert applicant.errors[:zip].any?
    assert applicant.errors[:birthdate].any?
    assert applicant.errors[:landline].any?
    assert applicant.errors[:mobile].any?
    assert applicant.errors[:email].any?
    assert applicant.errors[:date_available_for_work].any?
    assert applicant.errors[:desired_salary_range].any?
  end

  test "email should be unique" do
    applicant = Applicant.new
    assert !assert.save
  end

end

