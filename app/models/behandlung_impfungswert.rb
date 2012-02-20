class BehandlungImpfungswert < ActiveRecord::Base
	self.table_name = "behandlungen_impfungswerte"
	
	has_many :behandlungen
	has_many :impfungswerte
	
	
	def self.impfungswerte_for_behandlung(behandlung_id)
		BehandlungImpfungswert.select( 'impfungswert_id' ).where( 'behandlungen_impfungswerte.behandlung_id = ?', behandlung_id ).all().map { |rec| rec.impfungswert_id } 
	end
end
