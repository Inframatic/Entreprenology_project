class SessionsController < ApplicationController
  def new
    @user = MasterUser.new
  end

  def create
    user = MasterUser.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:master_user_id] = user.id
      redirect_to users_url, :notice => "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:master_user_id] = nil
    redirect_to users_url, :notice => "Logged out"
  end
end