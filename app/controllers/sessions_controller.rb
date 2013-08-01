class SessionsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.authenticate(params[:email], params[:password])
    if @account 
      session[:account_id] = @account.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to accounts_url, :notice => "Logged out"
  end
end