class MasterUsersController < ApplicationController
	def show
	end

  def new
    @master_user = MasterUser.new
  end

  def create
    params.permit!
    @master_user = MasterUser.new(params[:master_user])
      if @master_user.save
        redirect_to master_users_url, :notice => "Signed up!"
      else
        render "new"
      end
  end

	def edit
	end

	def update
	end

	def destroy
	end
end
