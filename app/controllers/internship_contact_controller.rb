class InternshipContactController < ApplicationController

  def show
    @internship_contact = InternshipContact.find(params[:id])
  end

  def new
    @internship_contact = InternshipContact.new
  end

  def create
    @internship_contact = InternshipContact.new
  end

  def edit
    @internship_contact = InternshipContact.find(params[:id])
  end

  def update
    @internship_contact = InternshipContact.find(params[:id])
  end

  def destroy
    @internship_contact = InternshipContact.find(params[:id])
  end
end
