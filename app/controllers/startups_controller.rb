class StartupsController < ApplicationController


  def index
    @startups = Startup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @startups }
    end
  end


  def show
    @startup = Startup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @startup }
    end
  end


  def edit
    @startup = Startup.find(params[:id])
  end


  def new
    @startup = Startup.new
    @startup.build_account(params[:account])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @startup }
    end
  end


  def create
     # render json: startup_params.to_json and return
    @startup = Startup.new(startup_params)

    respond_to do |format|
      if @startup.save
        format.html { redirect_to root_url, notice: 'Company Profile Created!' }
        format.json { render json: @startup, status: :created, location: @startup }
      else
        format.html { render action: "new" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @startup = Startup.find(params[:id])

      if @startup.update_attributes(params[:startup])
        #format.html { redirect_to @startup, notice: 'The startup profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
  end


  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy

    respond_to do |format|
      format.html { redirect_to startups_url }
      format.json { head :no_content }
    end
  end

  private

  def startup_params

    params.require(:startup).permit(:company_name, :number_of_employees,
     :logo, :founded, account_attributes: [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end

end 

