class AccountsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json


	def show
    respond_with Account.find(params[:id])
	end

  def new
    respond_with Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.save
    AccountMailer.registration_confirmation(@account).deliver
    respond_with @account
  end

  def edit
    respond_with Account.find(params[:id])
  end

  def update

    @account.update(account_params)
    respond_with @account
 end

  private

    def set_user
        @account = current_user
    end
    
    def account_params
      params.require(:account).permit(:password, :email, :industry, :country,
        :city, :postal_code, :description)
    end

end
  

