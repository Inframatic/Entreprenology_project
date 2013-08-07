class ApplicationController < ActionController::API
  protect_from_forgery with: :exception
  # above line was to be deleted?
  helper_method :current_user

  private

  def current_user
    @current_user ||= Account.find(session[:account_id]) if session[:account_id]
  end
end  