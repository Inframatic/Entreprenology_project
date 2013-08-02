class AccountsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


	def show
	end


  def new
    @account = Account.new
  end


  def create
    @account = Account.new(account_params)
      if @account.save
        AccountMailer.registration_confirmation(@account).deliver
        redirect_to accounts_url, :notice => "Signed up!"
      else
        render "new"
      end
  end


  def edit
    @uaccount = current_user
  end
	# def edit
 #    @account = Account.find(params[:id])
	# end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
 end
  # def update
 #    @account = current_account.accounts.find(params[:id])
 #    @account.update_attributes!(account_params)
 #    redirect_to show_account_path
	# end


	def destroy
	end


  private

    def set_user
        @user = current_user
    end
    
    def account_params
      params.require(:account).permit(:password, :email)
    end

end
  

