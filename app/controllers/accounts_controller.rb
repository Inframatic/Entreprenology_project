class AccountsController < ApplicationController
	def show
	end

  def new
    @account = Account.new
  end

  def create
    params.permit!
    @account = Account.new(params[:logable_id])
      if @account.save
        redirect_to accounts_url, :notice => "Signed up!"
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
