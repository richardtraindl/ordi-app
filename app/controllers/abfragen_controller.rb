# encoding: utf-8

class AbfragenController < ApplicationController

  include ApplicationHelper

  def index
		@karteikarten = []
		
		if params[:abfrage].nil?
		    @abfrage = Abfrage.first
		else
		    @abfrage = Abfrage.find(params[:abfrage])

				params[:param1].nil? ? @param1 = "" : @param1 = params[:param1]

				params[:param2].nil? ? @param2 = "" : @param2 = params[:param2]
								
				@persopt = params[:persopt]
								
				@tieropt = params[:tieropt]
									
				puts ( "###############" + @param1 + @param2 + "###########" )
				
				if @abfrage.id == 1 || @abfrage.id == 13 # postadresse
						params[:param1].blank? ? flash.now[:error] = "Eingabe fehlt!" : @karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :person => :postadressen])
				
				elsif @abfrage.id == 15 # kontakt
						params[:param1].blank? ? flash.now[:error] = "Eingabe fehlt!" : @karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :person => :kontakte])
				
				elsif @abfrage.id == 5 || @abfrage.id == 7 || @abfrage.id == 12	|| @abfrage.id == 14 ||
							@abfrage.id == 16 || @abfrage.id == 17 || @abfrage.id == 8 #tier.*, person.*
								params[:param1].blank? ? flash.now[:error] = "Eingabe fehlt!" : @karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person])
				
				elsif @abfrage.id == 2 || @abfrage.id == 3 || @abfrage.id == 6 #arznei, arzneimittel, diagnose
						params[:param1].blank? ? flash.now[:error] = "Eingabe fehlt!" : @karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :tier => :behandlungen])
				
				elsif @abfrage.id == 4 #behandlung -> behandlungsdatum
						if check_date(params[:param1]) && check_date(params[:param2])
								@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, DateTime.parse( @param1 ), DateTime.parse( @param2 )], :joins => [:tier, :person, :tier => :behandlungen])
						else
								flash[:error] = "Falsches oder unvollständiges Datum"
								# redirect_to abfragen_path() and return
						end
            
				elsif @abfrage.id == 9 # finanzamt -> behandlungsdatum
						if check_date(params[:param1]) && check_date(params[:param2])
								@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*, behandlungen.behandlungsdatum", :conditions => [@abfrage.bedingung, DateTime.parse( @param1 ), DateTime.parse( @param2 )], :joins => [:tier, :person, :tier => :behandlungen])
						else
								flash[:error] = "Falsches oder unvollständiges Datum"
								# redirect_to abfragen_path() and return
						end


				elsif @abfrage.id == 10 #impfung -> datum
						if check_date(params[:param1]) && check_date(params[:param2])
								@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, DateTime.parse( @param1 ), DateTime.parse( @param2) ], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])
						else
								flash[:error] = "Falsches oder unvollständiges Datum!"
								# redirect_to abfragen_path() and return
						end
		
				elsif @abfrage.id == 11 #impfung
						params[:param1].blank? ? flash.now[:error] = "Eingabe fehlt!" : @karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])
				end
		end

    if params[:csv] == 't' && !@karteikarten.empty?
					send_data(csv_for(@karteikarten),
						:type => csv_content_type,
						:filename => "finanzamt.csv") and return
    end
    
    ## render :index
						
  end # method index
  
private
    def csv_content_type
      case request.user_agent
        when /windows/i
          'application/vnd.ms-excel'
        else
          'text/csv'
      end
    end

   def csv_for(karteikarten)
      buf = "Familienname,Tiername,Beh.Datum\n"
      
      karteikarten.each do |karteikarte|
        karteikarte.tier.behandlungen.each do |behandlung|
          buf << karteikarte.person.familienname + "," + 
                 karteikarte.tier.tiername + "," + 
                 behandlung.behandlungsdatum.strftime( '%d.%m.%Y' ) + "\n"
        end
      end

      return buf
   end

end
