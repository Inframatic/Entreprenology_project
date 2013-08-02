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
    @intern.account.build
  end

  def create
    params.permit!
    @intern = Intern.new(params[:intern])
      if @intern.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render "new"
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
end
