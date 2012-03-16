class BehandlungenController < ApplicationController

  def destroy
		@behandlung = Behandlung.find(params[:id])
		@behandlung.destroy

    redirect_to edit_karteikarte_path(params[:karteikarte_id])
  end
  
  
end