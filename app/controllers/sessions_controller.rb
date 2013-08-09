class SessionsController < ApplicationController
  

  

 	def create
  	@account = Account.authenticate(params[:email], params[:password])
    if @account 
      session[:account_id] = @account.id
      # render some.json.jbuilder
    else
      # render something-else.json.jbuilder
    end
  end


  def destroy
    session[:account_id] = nil
    # render some.json.jbuilder
  end

end