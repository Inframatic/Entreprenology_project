class AccountsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      AccountMailer.registration_confirmation(@account).deliver
      # render some.json.jbuilder
    else
      # render new.json.jbuilder
    end
  end


  def edit
    @account = Account.find(params[:id])
  end


  def update
    @account.update(account_params)
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
  

