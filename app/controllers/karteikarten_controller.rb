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
	@karteikarte		    = Karteikarte.new

	@person				    = Person.new
	@person.postadressen	<< Postadresse.new
	@person.kontakte		<< Kontakt.new
	@person.kontakte		<< Kontakt.new

	@tier					= Tier.new
	@tier.behandlungen		<< Behandlung.new
	@behandlungen			= @tier.behandlungen
	@tier.behandlungen[0].impfungswerte << Impfungswert.new
  end


  # GET /owners/1/edit
  def edit
    @karteikarte 	= Karteikarte.find(params[:id])

	@person     	= Person.find(@karteikarte.person_id)

    @tier     	= Tier.find(@karteikarte.tier_id)
	@tier.behandlungen.sort! { |a,b| a.behandlungsdatum <=> b.behandlungsdatum }

  end


  def neues_tier
	@karteikarte	= Karteikarte.find(params[:id])
  
	@person     	= Person.find(@karteikarte.person_id)
	@person.save

	@tier 			= Tier.new(:geschlechtswert_id => 0)
	@tier.behandlungen	<< Behandlung.new
	@tier.save

	@karteikarte 			= Karteikarte.new(:person_id => @person.id, :tier_id => @tier.id)
	@karteikarte.save

	render :action => :edit
  end


  # POST /owners
  # POST /owners.json
  def create
	@person 		= Person.new(params[:karteikarte][:person])
	@person.save

	@tier 			= Tier.new(params[:karteikarte][:tier])

	@tier.behandlungen.sort! { |a,b| a.behandlungsdatum <=> b.behandlungsdatum }
	@behandlung = @tier.behandlungen.last
	if @behandlung.nil?
		@tier.behandlungen << Behandlung.new
	else
		unless(@behandlung.gewicht_kg.empty? && @behandlung.diagnose.empty? && 
			   @behandlung.laborwerte1.empty?  && @behandlung.laborwerte2.empty? && 
			   @behandlung.arzneien.empty? && @behandlung.arzneimittel.empty?)
			@tier.behandlungen << Behandlung.new
		end
	end
	
	#@behandlung.impfungswerte = Impfungswert.find(@params[:impfungswert_ids]) if @params[:impfungswert_ids]

	@tier.save

	@karteikarte 			= Karteikarte.new(:person_id => @person.id, :tier_id => @tier.id)
	@karteikarte.save

	# @inoculation_therapies = Array.new[][]
	# @behandlung_inoculation = Behandlung.new(params[:karteikarte][:therapies_inoculations])
	# @inoculations = Inoculation.new(:therapy_id => @behandlung_inoculation.id, id=> params[:karteikarte][:therapies_inoculations][:inoculations])

	# puts @inoculation_therapies[0]

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
	@tier.behandlungen.sort! { |a,b| a.behandlungsdatum <=> b.behandlungsdatum }
	@behandlung = @tier.behandlungen.last
	if @behandlung.nil?
		@tier.behandlungen << Behandlung.new
	else
		unless(@behandlung.gewicht_kg.empty? && @behandlung.diagnose.empty? && 
			   @behandlung.laborwerte1.empty?  && @behandlung.laborwerte2.empty? && 
			   @behandlung.arzneien.empty? && @behandlung.arzneimittel.empty?)
			@tier.behandlungen << Behandlung.new
		end
	end
	@tier.save

	@karteikarte.save

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
  
end
