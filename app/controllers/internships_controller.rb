class InternshipsController < ApplicationController
  respond_to :json

  
  def index
    @internships = Internship.all
    respond_with(@internship)
  end

  def show
    @internship = Internship.find(params[:id])
    respond_with(@internship)
  end

  def new
    @internship = Internship.new
  end

  def create
    @internship = Internship.new(params[:id])
    if @internship.save
      # render some.json.jbuilder
    else
      # render new.json.jbuilder
    end
  end

  def edit
    @internship = Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])
    if @internship.update_attributes(params[:internship])
      # render some.json.jbuilder
    else
      # render edit.json.jbuilder
    end
  end

  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy
  end

end