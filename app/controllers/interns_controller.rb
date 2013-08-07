class InternsController < ApplicationController
  respond_to :json

  def index
    respond_with Intern.all
  end

  def show
    respond_with Intern.find(params[:id])
  end

  def new
    @intern = Intern.new
    @intern.build_account(params[:account])
    respond_with @intern
  end

  def create
    @intern = Intern.new(intern_params)
    @intern.save
    respond_with @intern
  end


  def edit
    respond_with Intern.find(params[:id])
  end


  def update
    @intern = Intern.find(params[:id])
    @intern.update_attributes(params[:intern])
    respond_with @intern
  end

  def destroy
    @intern = Intern.find(params[:id])
    @intern.destroy
    respond_with @intern
  end

  private

  def intern_params
    params.require(:intern).permit(:first_name, :last_name, :dob, account_attributes:
     [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end
end
