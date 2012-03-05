class SessionsController < ApplicationController
  def new
    @users = User.find(:all).map {|u| [u.username, u.id] }
    render 'new'
  end
  
  def create
    @user = User.authenticate(params[:sessions][:userid], params[:sessions][:password])
    
    if @user.nil?
      flash.now[:error] = "Falsches Passwort"
      @users = User.find(:all).map {|u| [u.username, u.id] }
      render 'new'
    else
      @user.save
      sign_in @user
      flash.now[:succes] = "Willkommen!"
      redirect_to karteikarten_path
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end
