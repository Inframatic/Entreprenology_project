class AccountsController < ApplicationController
	def show
	end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
      if @account.save
        redirect_to accounts_url, :notice => "Signed up!"
      else
        render "new"
      end
  end

	def edit
    @account = Account.find(account_params)
	end

	def update
    @account = current_account.accounts.find(params[:id])
    @account.update_attributes!(account_params)
    redirect_to show_account_path
	end

	def destroy
	end

  private

    def account_params
      params.require(:account).permit(:password, :email, :industry, :country,
        :city, :postal_code, :description)
    end
end
