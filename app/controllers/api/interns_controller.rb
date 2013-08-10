class Api::InternsController < Api::BaseController

  def index
    @interns = Intern.all
    respond_with(@intern)
  end


  def show
    @intern = Intern.find(params[:id])
    respond_with(@intern)
  end


  def new
    @intern = Intern.new
    @intern.build_account(params[:account])
  end


  def create
    @intern = Intern.new(intern_params)
    if @intern.save
      # render some.json.jbuilder
    else
      # render new.json.jbuilder
    end
  end


  def edit
    @intern = Intern.find(params[:id])
  end


  def update
    @intern = Intern.find(params[:id])
    if @intern.update(account_params[:intern])
      # render some.json.jbuilder
    else
      # render edit.json.jbuilder
    end
  end


  def destroy
    @intern = Intern.find(params[:id])
    @intern.destroy
  end



  private

  def intern_params
    params.require(:intern).permit(:first_name, :last_name, :dob, account_attributes:
     [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end

end
