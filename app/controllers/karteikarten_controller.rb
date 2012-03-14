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
    
    puts "FFFFFFFFF" + @edit_behandlung.diagnose + @edit_behandlung.arzneien + @edit_behandlung.gewicht_kg 
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

	@tier.save
	
	@edit_behandlung = Behandlung.new(params[:edit_behandlung])
	unless params[:behandlung_id].blank?
		@edit_behandlung.tier_id = @tier.id
		@edit_behandlung.save
	end

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
			@edit_behandlung.tier_id = @tier.id
			@edit_behandlung.save			
	  else
	    @edit_behandlung = Behandlung.find( params[:behandlung_id])
	    @edit_behandlung.update_attributes( params[:edit_behandlung] )
	  end
		
  	@tier.save

	  @karteikarte.save	

	  render(:action => :edit)
  end


  def update_behandlung_attr
    @behandlung = Behandlung.find(params[:id])
    
    @attr = params[:attr].to_i
    case @attr
      when 1
        @behandlung.behandlungsdatum = DateTime.parse(params[:behandlungsdatum_str])
        @behandlung.save    
      when 2
        @behandlung.diagnose = params[:diagnose]
        @behandlung.save    
      when 3
        @behandlung.laborwerte1 = params[:laborwerte1]
        @behandlung.save    
      when 4
        @behandlung.laborwerte2 = params[:laborwerte2]
        @behandlung.save    
      when 5
        @behandlung.arzneien = params[:arzneien]      
        @behandlung.save    
      when 6
        @behandlung.arzneimittel = params[:arzneimittel]      
        @behandlung.save    
      when 7
        #Impfung.destroy_all(:behandlung_id => params[:id]) 
        Impfung.delete_all("behandlung_id =" + params[:id]) 
         # Post.delete_all("person_id = 5 AND (category = 'Something' OR category = 'Else')")

        @impfungswerte = (params[:impfungswert_ids]) # .split(/,/)
        puts @impfungswerte[0] + "..................................."
        @impfungswerte.each { |wert|
          @impfung = Impfung.new(:behandlung_id => params[:id], :impfungswert_id => wert)
          @impfung.save
        }
        
      when 8
        @behandlung.gewicht_kg = params[:gewicht_kg]
        @behandlung.save
    end
    
    redirect_to edit_karteikarte_path(@karteikarte)
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
  
	
  def destroy_behandlung
		@behandlung = Behandlung.find(params[:behandlung_id])
		@behandlung.destroy

    redirect_to edit_karteikarte_path(params[:id])
  end


end



