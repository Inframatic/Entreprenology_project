class StartupsController < ApplicationController

  def index
    @startups = Startup.all
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
    # Make the variable @startup a new startup with the given params
    @startup = Startup.new(params[:startup])
    if 
      @startup.save
      # if the save for the startup was successful, go to index.html.erb
      redirect_to startup_url
    else
      # Otherwise render the view associated with the action :new (i.e. new.html.erb)
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

