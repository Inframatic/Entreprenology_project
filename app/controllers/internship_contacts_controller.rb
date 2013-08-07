class InternshipContactsController < ApplicationController
  respond_to :json 

  def show
    respond_with InternshipContact.find(params[:id])
  end

  def new
    respond_with InternshipContact.new
  end

  def create
    @internship_contact = InternshipContact.new(params[:id])
    @internship_contact.save
    respond_with @internship_contact
  end

  def edit
    respond_with InternshipContact.find(params[:id])
  end

  def update
    @internship_contact = InternshipContact.find(params[:id])
    @internship_contact.update_attributes(params[:internship_contact])
    respond_with @internship_contact
  end

  def destroy
    @internship_contact = InternshipContact.find(params[:id])
  end
end
