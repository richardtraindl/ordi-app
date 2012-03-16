class BehandlungenController < ApplicationController

  def index
  end

  def show
  end	
	
  def new
  end

  def create
  end
  
  def edit
  end

  def update
  end
	
  def destroy
		@behandlung = Behandlung.find(params[:id])
		@behandlung.destroy

    redirect_to edit_karteikarte_path(params[:karteikarte_id])
  end
  
end