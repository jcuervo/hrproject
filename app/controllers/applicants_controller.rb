class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
  end

  def show
    @applicant = Applicant.where(:id => params[:id])
  end

  def new
    session[:applicant_params] ||= {}
    @applicant = Applicant.new
    @applicant.educations.build 
  end

  def create
    session[:applicant_params].deep_merge!(params[:applicant]) if params[:applicant]
    @applicant = Applicant.new(session[:applicant_params])
    @applicant.current_step = session[:applicant_step]

    if @applicant.valid?
      if params[:back]
        @applicant.previous_step
      elsif @applicant.last_step?
        @applicant.save  if params[:commit]          
      else
        @applicant.next_step
      end

      session[:applicant_step] = @applicant.current_step
    end
    
    if @applicant.new_record?
      render "new"
    else
      session[:applicant_step] = session[:applicant_params] = nil
      flash[:notice] = "applicant saved!"
      redirect_to @applicant
    end    
  end 
  
end
