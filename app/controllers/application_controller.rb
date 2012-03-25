class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login

protected
  def not_authenticated
    flash[:error] = "Bitte anmelden."
    redirect_to login_path()
  end

end
