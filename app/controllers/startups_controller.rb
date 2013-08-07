class StartupsController < ApplicationController
  respond_to :json

  def index
    respond_with Startup.all
  end


  def show
    respond_with Startup.find(params[:id])
  end

  def new
    @startup = Startup.new
    @startup.build_account(params[:account])

    respond_with @startup
  end

  def create
     # render json: startup_params.to_json and return
    @startup = Startup.new(startup_params)
    @startup.save
    respond_with @startup
  end

  def edit
    respond_with Startup.find(params[:id])
  end

  def update
    @startup = Startup.find(params[:id])
    @startup.update_attributes(params[:startup])
    respond_with @startup
  end


  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy
    respond_with @startup
    end
  end

  private

  def startup_params

    params.require(:startup).permit(:company_name, :number_of_employees,
     :logo, :founded, account_attributes: [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end

end 

