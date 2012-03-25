class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
  end
  
  def create
    if @user = login(params[:username], params[:password])
      flash[:notice] = 'Anmeldung erfolgreich.'
      redirect_to karteikarten_path()
    else
      flash.now[:error] = "Fehler bei Anmeldung."
      render :action => :new
    end
  end
    
  def destroy
    logout
    flash[:notice] = 'Auf wiedersehen!'
    redirect_to login_path()
  end
end
