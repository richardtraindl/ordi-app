require 'lookups.rb'

class KarteikartenController < ApplicationController
  # GET /owners
  # GET /owners.json
  def index
    params[:familienname].nil? ? @familienname = "" : @familienname = "" + params[:familienname]

    params[:tiername].nil? ? @tiername = "" : @tiername = "" + params[:tiername]

    @karteikarten = Karteikarte.find(:all, :include => [:person, :tier], :conditions => ['personen.familienname LIKE ? AND tiere.tiername LIKE ?', @familienname + '%', @tiername + '%'])
  end


	# GET /owners/new
  # GET /owners/new.json
  def new
    @karteikarte          = Karteikarte.new

    @person               = Person.new
    @person.postadressen  << Postadresse.new
    @person.kontakte      << Kontakt.new
    @person.kontakte      << Kontakt.new

    @tier                 = Tier.new
    @tier.behandlungen    << Behandlung.new
  end

  

  # GET /owners/1/edit
  def edit
    @karteikarte  = Karteikarte.find(params[:id])

    @person       = Person.find(@karteikarte.person_id)

    @tier         = Tier.find(@karteikarte.tier_id) 
    
  end
  

  # POST /owners
  # POST /owners.json
  def create
    @person           = Person.new(params[:karteikarte][:person])
    @person.save

    @tier             = Tier.new(params[:karteikarte][:tier])
    if params[:neue_behandlung] == "true"
      @tier.behandlungen    << Behandlung.new
    end
    @tier.save

    @karteikarte      = Karteikarte.new(:person_id => @person.id, :tier_id => @tier.id)
    @karteikarte.save

    render :action => :edit
  end



  # PUT /owners/1
  # PUT /owners/1.json
  def update
    @karteikarte 	= Karteikarte.find(params[:id])

    @person     	= Person.find(@karteikarte.person_id)
    @person.update_attributes(params[:karteikarte][:person])
    @person.save

    @tier     		= Tier.find(@karteikarte.tier_id)
    @tier.update_attributes(params[:karteikarte][:tier])
    if params[:neue_behandlung] == "true"
      @tier.behandlungen    << Behandlung.new
    end
    @tier.save

    @karteikarte.save



=begin
		@behandlung = @tier.behandlungen.last # order( 'behandlungsdatum desc' )
		unless !@behandlung.nil? && @behandlung.diagnose.blank? && @behandlung.laborwerte1.blank? && @behandlung.laborwerte2.blank? &&
					 @behandlung.arzneien.blank? && @behandlung.arzneimittel.blank? && @behandlung.impfungswert_ids.blank? && @behandlung.gewicht_kg.blank?
			@tier.behandlungen    << Behandlung.new
		end
=end
    render(:action => :edit)
  end


  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @karteikarte = Karteikarte.find(params[:id])

    @karteikarten = Karteikarte.find(:all, :conditions => { :person_id => @karteikarte.person_id })
    if @karteikarten.length == 1
      @person = Person.find(:first, :conditions => { :id => @karteikarte.person_id })
      @person.destroy
    end

    @karteikarten.clear
    @karteikarten = Karteikarte.find(:all, :conditions => { :tier_id => @karteikarte.tier_id })
    if @karteikarten.length == 1
      @tier = Tier.find(:first, :conditions => { :id => @karteikarte.tier_id })
      @tier.destroy
    end

    @karteikarte.destroy

    redirect_to(karteikarten_path)
  end

  # GET /karteikarte/:id/print
  def print
    @karteikarte  = Karteikarte.find(params[:id])

    render :action => 'print', :layout => 'print'
  end
  
end



