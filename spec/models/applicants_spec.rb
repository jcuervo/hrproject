require 'spec_helper'

describe "Applicants" do
  specify { Factory.build(:applicant).should be_valid }

  context "unique values" do

    before :all do
      @applicant = Factory.create(:applicant)
    end

    it "should have a unique email address" do
      Factory.build(:applicant, :email => @applicant.email).should_not be_valid
    end
  end

  context "required attributes" do
    it "should be invalid without first name" do
      Factory.build(:applicant, :first_name => nil).should_not be_valid
    end

    it "should be invalid without middle name" do
      Factory.build(:applicant, :middle_name => nil).should_not be_valid
    end

    it "should be invalid without last name" do
      Factory.build(:applicant, :last_name => nil).should_not be_valid
    end

  end

    it "should have many educations" do
      education = Factory(:education)
      assert(education.applicant.educations.size >= 1)
      assert_equal(education.applicant.educations.first.school_name,"school test")
    end

    it "should have many work experiences" do
      work_experience = Factory(:work_experience)
      assert(work_experience.applicant.work_experiences.size >= 1)
      assert_equal(work_experience.applicant.work_experiences.first.employer,"employer test")
    end

    it "should have many pending applications" do
      applicant = Factory(:applicant_with_pending_applications)
      applicant.pending_applications(true)
    end

    it "should have many families" do
      family = Factory(:family)
      assert(family.applicant.families.size >= 1)
      assert_equal(family.applicant.families.first.relationship,"relationship test")
    end

    it "should have many references" do
      reference = Factory(:reference)
      assert(reference.applicant.references.size >= 1)
      assert_equal(reference.applicant.references.first.name,"test")
    end

    it "should have many questions through question and answer" do
      applicant = Factory.build(:applicant)
      question = Factory.build(:question)
      qanda = Factory.create(:qanda)
    end
end


