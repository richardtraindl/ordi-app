require 'lookups.rb'

class TiereController < ApplicationController

  def new
    karteikarte  = Karteikarte.find(params[:karteikarte_id])
    
    person       = Person.find(karteikarte.person_id)

    tier  = Tier.new
    #tier.geschlechtswert_id = 0
    tier.behandlungen << Behandlung.new
    tier.save!

    karteikarte2  = Karteikarte.new( :person_id => person.id, :tier_id => tier.id )
    
    karteikarte2.save!

    redirect_to edit_karteikarte_path( karteikarte2.id )
  end

end
