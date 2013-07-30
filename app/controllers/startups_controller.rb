class StartupsController < ApplicationController

  def index
    # @startup = Startup.all

    @startups = [
      {
        :company_name  => "Apple",
        :contact_person => "Steve Jobs",
        :contact_person_email => "steve@apple.com",
        :industry => "consumer electronics",
        :city => "Palo Alto",
        :country => "USA",
        :number_of_employees => "60,000",
        :logo => "N/A",
        :banner => "N/A"
      },
      {
        :company_name  => "Apple",
        :contact_person => "Steve Jobs",
        :contact_person_email => "steve@apple.com",
        :industry => "consumer electronics",
        :city => "Palo Alto",
        :country => "USA",
        :number_of_employees => "60,000",
        :logo => "N/A",
        :banner => "N/A"
      },
      {
        :company_name  => "Apple",
        :contact_person => "Steve Jobs",
        :contact_person_email => "steve@apple.com",
        :industry => "consumer electronics",
        :city => "Palo Alto",
        :country => "USA",
        :number_of_employees => "60,000",
        :logo => "N/A",
        :banner => "N/A"
      }
    ]
  end
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
    @startup = Startup.new(params[:startup])
    if 
      @startup.save
      redirect_to startup_url
    else
      render :new
    end
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
