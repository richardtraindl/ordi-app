class Impfungswert < ActiveRecord::Base
	self.table_name = "impfungswerte"

	has_and_belongs_to_many :behandlungen
	
end
