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
