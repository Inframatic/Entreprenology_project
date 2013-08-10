class Api::StartupsController < Api::BaseController
  
  def index
    @startups = Startup.all
    respond_with @startups
  end


  def show
    @startup = Startup.find(params[:id])
    respond_with @startup
  end


  def new
    @startup = Startup.new
    @startup.build_account(params[:account])
  end


  def create
    @startup = Startup.new(startup_params)
    if @startup.save
      # render json something
    else
      # render new.json.jbuilder
    end
  end


  def edit
    @startup = Startup.find(params[:id])
  end


  def update
    @startup = Startup.find(params[:id])
    if @startup.update_attributes(params[:startup])
      # render some.json.jbuilder
    else
      # render edit.json.jbuilder
    end
  end


  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy
  end


  private

  def startup_params
    params.require(:startup).permit(:company_name, :number_of_employees,
     :logo, :founded, account_attributes: [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end

end 

