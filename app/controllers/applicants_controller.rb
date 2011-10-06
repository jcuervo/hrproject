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

    if (@applicant.current_step == "education")
      @applicant.educations.build
      puts "education build"
    end
  end

  def create
    session[:applicant_params].deep_merge!(params[:applicant]) if params[:applicant]
    @applicant = Applicant.new(session[:applicant_params])
    @applicant.current_step = session[:applicant_step]

logger.info @applicant.inspect
    #if params[:back_button]
    #  @applicant.previous_step
    #els
    if @applicant.last_step?
    logger.info "hutaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      @applicant.save
    #else
    #  @applicant.next_step
    end
    
    session[:applicant_step] = @applicant.current_step
    
    if @applicant.new_record?
      render "new"
    else
      session[:applicant_step] = session[:applicant_params] = nil
      flash[:notice] = "applicant saved!"
      redirect_to @applicant
    end
  end

end
