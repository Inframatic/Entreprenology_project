class InternsController < ApplicationController
  def index
    @interns = Intern.all

    respond_to do |format|
      format.html
      format.json { render json: @interns}
    end
  end

  def show
    @intern = Intern.find(params[:id])

      respond_to do |format|
      format.html
      format.json { render json: @intern}
    end
  end

  def edit
    @intern = Intern.find(params[:id])
  end

  def new
    @intern = Intern.new
    @intern.build_account(params[:account])
  end

  def create
    # render text: params.to_yaml and return
    @intern = Intern.new(intern_params)
      if @intern.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render :new
      end
  end

  def update
    @intern = Intern.find(params[:id])

    respond_to do |format|
      if @intern.update_attributes(params[:intern])
        format.html { redirect_to @intern, notice: 'Profile updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intern.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @intern = Intern.find(params[:id])
    @intern.destroy

      respond_to do |format|
      format.html { redirect_to interns_url }
      format.json { head :no_content }
    end
  end

  private

  def intern_params
    params.require(:intern).permit(:first_name, :last_name, :dob, account_attributes:
     [:email, :industry, :country, :city, :postal_code,
      :description, :password])
  end
end
