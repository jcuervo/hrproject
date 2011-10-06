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

    it "should be invalid without gender" do
      Factory.build(:applicant, :gender => nil).should_not be_valid
    end

    it "should be invalid civil status" do
      Factory.build(:applicant, :civil_status => nil).should_not be_valid
    end

    it "should be invalid without street" do
      Factory.build(:applicant, :street => nil).should_not be_valid
    end

    it "should be invalid without city" do
      Factory.build(:applicant, :city => nil).should_not be_valid
    end

    it "should be invalid without region" do
      Factory.build(:applicant, :region => nil).should_not be_valid
    end

    it "should be invalid without zip" do
      Factory.build(:applicant, :zip => nil).should_not be_valid
    end

    it "should be invalid without birthdate" do
      Factory.build(:applicant, :birthdate => nil).should_not be_valid
    end

    it "should be invalid without landline" do
      Factory.build(:applicant, :landline => nil).should_not be_valid
    end

    it "should be invalid without mobile" do
      Factory.build(:applicant, :mobile => nil).should_not be_valid
    end

    it "should be invalid without email" do
      Factory.build(:applicant, :email => nil).should_not be_valid
    end

    it "should be invalid without date available for work" do
      Factory.build(:applicant, :date_available_for_work => nil).should_not be_valid
    end

    it "should be invalid without desired salary range" do
      Factory.build(:applicant, :desired_salary_range => nil).should_not be_valid
    end
  end
end
