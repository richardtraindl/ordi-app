puts "loading lookups.rb (in lib/)"   # helper to check/debug loading order

module Lookup

  def self.anredewerte
  	@@anredewerte				||= Anredewert.find(:all).map {|u| [u.wert, u.id] }
  end

  def self.geschlechtswerte
  	@@geschlechtswerte			||= Geschlechtswert.find(:all).map {|u| [u.wert, u.id] }
  end
	
  def self.impfungswerte
	@@impfungswerte				||= Impfungswert.find(:all, :order => ("wert ASC")).map {|u| [u.wert, u.id] }
  end	

  def self.laborwerte
  	@@laborwerte				||= Laborwert.find(:all, :order => ("sortkey ASC"))
	# .map {|u| [u.id, u.wert, u.tierart, u.sortkey] }
  end

end