require 'lookups.rb'

class BehandlungenController < ApplicationController

  def destroy
		@behandlung = Behandlung.find(params[:id])
    unless @behandlung.nil?
  		@behandlung.destroy
    end

    redirect_to edit_karteikarte_path(params[:karteikarte_id])
  end
  
end
