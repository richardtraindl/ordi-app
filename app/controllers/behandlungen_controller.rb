require 'lookups.rb'

class BehandlungenController < ApplicationController

  def new
    @karteikarte  = Karteikarte.find(params[:karteikarte_id])

    @tier         = Tier.find(@karteikarte.tier_id)
    
    @tier.behandlungen << Behandlung.new
    
    redirect_to edit_karteikarte_path(params[:karteikarte_id])
  end

  
  def destroy
		@behandlung = Behandlung.find(params[:id])
    unless @behandlung.nil?
  		@behandlung.destroy
    end

    redirect_to edit_karteikarte_path(params[:karteikarte_id])
  end
  
end
