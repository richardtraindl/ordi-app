class AbfragenController < ApplicationController
		def index
				if params[:abfrage].nil?
					@karteikarten = []
					@abfrage = Abfrage.first		
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
						@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, DateTime.parse( @param1 ), DateTime.parse( @param2 )], :joins => [:tier, :person, :tier => :behandlungen])
		
					elsif @abfrage.id == 10 #impfung -> datum
						@karteikarten = Karteikarte.find(:all, :select => "DISTINCT karteikarten.*", :conditions => [@abfrage.bedingung, DateTime.parse( @param1 ), DateTime.parse( @param2) ], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])
		
					elsif @abfrage.id == 11 #impfung
						@karteikarten = Karteikarte.find(:all, :conditions => [@abfrage.bedingung, @param1 + "%"], :joins => [:tier, :person, :tier => {:behandlungen => :impfungswerte}])
					end
					
				end	
		end  
end