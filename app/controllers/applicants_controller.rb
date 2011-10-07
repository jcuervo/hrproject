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
      elsif (@applicant.current_step == "education")
        if params[:commit]
          @applicant.save      

          if params[:applicant][:education]            
            Education.create(
              :applicant_id => @applicant.id,
              :address => params[:applicant][:education][:address],
              :school_name => params[:applicant][:education][:school_name],
              :years_attended => params[:applicant][:education][:years_attended],
              :course => params[:applicant][:education][:course]
            )
          end
        end
      elsif (@applicant.current_step == "work_experience")
        if params[:commit]
          if params[:applicant][:work_experience]            
            WorkExperience.create(
              :applicant_id => @applicant.id,
              :employer => params[:applicant][:education][:employer],
              :address => params[:applicant][:education][:address],
              :supervisor => params[:applicant][:education][:supervisor],
              :can_contact => params[:applicant][:education][:can_contact],
              :job_title => params[:applicant][:education][:job_title],
              :employed_from => params[:applicant][:education][:employed_from],
              :employed_to => params[:applicant][:education][:employed_to],
              :salary_range => params[:applicant][:education][:salary_range],
              :responsibilities => params[:applicant][:education][:responsibilities],
              :reason_for_leaving => params[:applicant][:education][:reason_for_leaving],
            )
          end          
        end      
      elsif (@applicant.current_step == "family_background")      
        if params[:commit]
          if params[:applicant][:family]            
            Family.create(
              :applicant_id => @applicant.id,
              :relationship => params[:applicant][:education][:relationship],
              :name => params[:applicant][:education][:name],
              :age => params[:applicant][:education][:age],
              :occupation => params[:applicant][:education][:occupation],
            )
          end 
        end
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
