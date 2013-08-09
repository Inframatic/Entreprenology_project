class Api::InternshipContactsController < Api::BaseController
  # respond_to :json

  def show
    @internship_contact = InternshipContact.find(params[:id])
    respond_with(@internship_contact)
  end


  def new
    @internship_contact InternshipContact.new
  end


  def create
    @internship_contact = InternshipContact.new(params[:id])
    if @internship_contact.save
      # render something.json.jbuilder
    else
      # render new.json.jbuilder
    end
  end


  def edit
    @internship_contact = InternshipContact.find(params[:id])
  end


  def update
    @internship_contact = InternshipContact.find(params[:id])
    if @internship_contact.update_attributes(params[:internship_contact])
      # render some.json.jbuilder
    else
      # render edit.json.jbuilder
    end
  end


  def destroy
    @internship_contact = InternshipContact.find(params[:id])
    @internship_contact.destroy
  end
end
