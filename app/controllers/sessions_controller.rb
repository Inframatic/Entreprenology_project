class SessionsController < ApplicationController
	respond_to :json	
 	def create
  	@account = Account.authenticate(params[:email], params[:password])
    respond_with @account
    # if @account 
    #   session[:account_id] = @account.id
    # end
  end

  def destroy
    session[:account_id] = nil
  end
end