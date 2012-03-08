require 'lookups.rb'

  def build_datetime_from_param( params, field_name )
    DateTime.new(      
      params["#{field_name.to_s}(1i)"].to_i,
      params["#{field_name.to_s}(2i)"].to_i,
      params["#{field_name.to_s}(3i)"].to_i
      )      
  end


class KarteikartenController < ApplicationController
  # GET /owners
  # GET /owners.json
  def index
	params[:familienname].nil? ? @familienname = "" : @familienname = "" + params[:familienname]

	params[:tiername].nil? ? @tiername = "" : @tiername = "" + params[:tiername]

	@karteikarten = Karteikarte.find(:all, :include => [:person, :tier], :conditions => ['personen.familienname LIKE ? AND tiere.tiername LIKE ?', @familienname + '%', @tiername + '%'])
  end


	def abfragen
		if params[:abfrage].nil?
			@karteikarten = Karteikarte.find(:all, :include => [:person, :tier], :conditions => ['personen.familienname LIKE "" AND tiere.tiername LIKE ""'])
			@abfrage = Abfrage.find(1)		
		else
			@abfrage = Abfrage.find(params[:abfrage].to_i)

			if @abfrage.id == 4 || @abfrage.id == 9 || @abfrage.id == 10
				params[:param1].nil? ? @param1 = "" : @param1 = params[:param1]
				params[:param2].nil? ? @param2 = "" : @param2 = params[:param2]				
			else
				params[:param1].nil? ? @param1 = "" : @param1 = params[:param1]
				@param2 = ""
			end
		
			@persopt = params[:persopt]
		
			@tieropt = params[:tieropt]
				
			puts ( "###############" + @param1 + @param2 + "###########" )
			
			if @abfrage.id == 1 || @abfrage.id == 13 # postadresse
				@karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :person => :postadressen])			
			
			elsif @abfrage.id == 15 # kontakt
				@karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :person => :kontakte])
			
			elsif @abfrage.id == 5 || @abfrage.id == 7 || @abfrage.id == 12	|| @abfrage.id == 14 ||
						@abfrage.id == 16 || @abfrage.id == 17 || @abfrage.id == 8 #tier, person
				@karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person])
			
			elsif @abfrage.id == 2 || @abfrage.id == 3 || @abfrage.id == 6 #behandlung
				@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :tier => :behandlungen])

			elsif @abfrage.id == 4  || @abfrage.id == 9 #behandlung -> datum
				@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, @param1, @param2], :joins => [:tier, :person, :tier => :behandlungen])

			elsif @abfrage.id == 10 #impfung -> datum
				@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, @param1, @param2], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])

			elsif @abfrage.id == 11 #impfung
				@karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])
			end
			
		end	
  end  
  


  # GET /owners/new
  # GET /owners/new.json
  def new
	@karteikarte					= Karteikarte.new

	@person				  			= Person.new
	@person.postadressen	<< Postadresse.new
	@person.kontakte			<< Kontakt.new
	@person.kontakte			<< Kontakt.new

	@tier									= Tier.new
	@tier.behandlungen		<< Behandlung.new
	#@tier.behandlungen[0].impfungswerte << Impfungswert.new
	
	@edit_behandlung 			= Behandlung.new
  end


  
  # GET /owners/1/edit
  def edit
  @karteikarte 	= Karteikarte.find(params[:id])

	@person     	= Person.find(@karteikarte.person_id)

  @tier     	= Tier.find(@karteikarte.tier_id)
	
	@edit_behandlung 			= Behandlung.new
  end

  
  
  def edit_behandlung
    @edit_behandlung 	= Behandlung.find(params[:id])
	end



  def neues_tier
	@karteikarte	= Karteikarte.find(params[:id])
  
	@person     	= Person.find(@karteikarte.person_id)
	@person.save

	@tier 			= Tier.new(:geschlechtswert_id => 0)
	@tier.behandlungen	<< Behandlung.new
	@edit_behandlung 			= Behandlung.new
	@tier.save

	@karteikarte 			= Karteikarte.new(:person_id => @person.id, :tier_id => @tier.id)
	@karteikarte.save

	@edit_behandlung 			= Behandlung.new
	
	render :action => :edit
  end



  # POST /owners
  # POST /owners.json
  def create
	@person 		= Person.new(params[:karteikarte][:person])
	@person.save

	@tier 			= Tier.new(params[:karteikarte][:tier])

	@edit_behandlung = Behandlung.new(params[:edit_behandlung])
	
=begin	
	if @behandlung.nil?
		@tier.behandlungen << Behandlung.new
	else
		unless(@behandlung.gewicht_kg.empty? && @behandlung.diagnose.empty? && 
			   @behandlung.laborwerte1.empty?  && @behandlung.laborwerte2.empty? && 
			   @behandlung.arzneien.empty? && @behandlung.arzneimittel.empty? && @behandlung.impfungswerte.empty?)
			@tier.behandlungen << Behandlung.new
		end
	end
=end

	@tier.save

	@edit_behandlung.save

	@karteikarte 			= Karteikarte.new(:person_id => @person.id, :tier_id => @tier.id)
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
	
    if params[:behandlung_id].blank?
			@edit_behandlung = Behandlung.new( params[:edit_behandlung] )
			@edit_behandlung.save			
	  else
	    @edit_behandlung = Behandlung.find( params[:behandlung_id])
	    @edit_behandlung.update_attributes( params[:edit_behandlung] )
	  end
		
		

	
=begin
	if @behandlung.nil?
		@tier.behandlungen << Behandlung.new
	else
		unless(@behandlung.gewicht_kg.empty? && @behandlung.diagnose.empty? && 
			   @behandlung.laborwerte1.empty?  && @behandlung.laborwerte2.empty? && 
			   @behandlung.arzneien.empty? && @behandlung.arzneimittel.empty? && @behandlung.impfungswerte.empty?)
			@tier.behandlungen << Behandlung.new
		end
	end
=end
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



