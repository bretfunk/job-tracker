class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
    @contact= Contact.new
    @contact.company_id = @company.id
    # redirect_to company_jobs_path(company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:notice] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy

    flash[:notice] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end

  def dashboard
    @level_of_interest = Job.group(:level_of_interest).count.sort.reverse
    @companies = Company.sort_by_level_of_interest
    @jobs = Job.all.group_by(&:city).values.flatten
    # People.all.group_by(&:age)
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
