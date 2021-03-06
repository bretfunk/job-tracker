class JobsController < ApplicationController

  def jobs
    # if params[:sort] == "location"
    #   @location = Job.where(city: params[:sort])
    # elsif params[:sort] == "interest"
    #   @interest = Job.where(level_of_interest: params[:sort])
    # elsif params[:location] == "location"
      @one_location = Job.where(city: params[:location])
    # end
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:notice] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_path(@company)
    else
      flash[:warning] = "#{@job.errors}"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
     if @job.update(job_params)
      flash[:notice] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      flash[:warning] = "#{@job.errors}"
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    if @job.destroy
      flash[:notice] = "You deleted #{@job.title} at #{@company.name}"
      redirect_to company_path(@company)
    else
      redirect_to company_job_path(@company, @job)
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
