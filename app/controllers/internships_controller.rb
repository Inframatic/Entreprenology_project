class InternshipsController < ApplicationController
  respond_to :json

  def index
    respond_with Internship.all
  end

  def show
    respond_with Internship.find(params[:id])
  end

  def new
    respond_with Internship.new
  end

  def create
    @internship = Internship.new(params[:id])
    @internship.save
    respond_with @internship
  end

  def edit
    respond_with Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])
    @internship.update_attributes(params[:internship])
    respond_with @internship
  end

  def destroy
    @internship = Internship.find(params[:id])
  end

end