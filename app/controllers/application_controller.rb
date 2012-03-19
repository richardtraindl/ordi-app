class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  
  before_filter :require_login
  before_filter :set_current_user
  
  def require_login
    ## not signed_in? and not session controller (to avoid infinite loop)    
    if signed_in? == false && [ 'sessions' ].include?( controller_name ) == false
      flash[:notice] = "Bitte Anmelden."
      redirect_to signin_path
    end
  end

  def set_current_user
    User.current = current_user
  end

  
end
