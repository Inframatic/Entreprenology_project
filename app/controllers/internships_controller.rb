class InternshipsController < ApplicationController

  def index
    @internships = Internship.all
  end

  def show
    @internship = Internship.find(params[:id])
  end

  def new
    @internship = Internship.new
  end

  def create
    @internship = Internship.new(params[:id])
  end

  def edit
    @internship = Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])
  end

  def destroy
    @internship = Internship.find(params[:id])
  end

end