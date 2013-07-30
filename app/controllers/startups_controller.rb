class StartupsController < ApplicationController

  def index
    @startup = Startup.all
  end


  def show
    @startup = Startup.find(params[:id])
  end


  def edit
    @startup = Startup.find(params[:id])
  end


  def new
    @startup = Startup.new
  end


  def create
    # @startup = Startup.new(params[:startup])
    # if 
    #   @startup.save
    #   redirect_to startup_url
    # else
    #   render :new
    # end
    render :text => "Saving a new Startup: Company Name: #{params[:company_name]}, Contact Person: #{params[:contact_person]}, Contact Person Email: #{params[:contact_person_email]}, Industry: #{params[:industry]}, City: #{params[:city]}, Country: #{params[:country]}, Number of Employees: #{params[:number_of_employees]}, Logo: #{params[:logo]}, Banner: #{params[:banner]}"
  end


  def update
    @startup = Startup.find(params[:id])
      if 
        @startup.update_attributes(params[:startup])
        redirect_to startup_path(@startup)
      else
        render :edit
      end
  end


  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy
  end

end 

