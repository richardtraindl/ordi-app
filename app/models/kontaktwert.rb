class Kontaktwert < ActiveRecord::Base
	self.table_name = "kontaktwerte"
	
	has_many 	:kontakte
end
