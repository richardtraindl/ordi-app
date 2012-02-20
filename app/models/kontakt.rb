class Kontakt < ActiveRecord::Base
	self.table_name = "kontakte"

	belongs_to	:person
	belongs_to 	:kontaktwert
end
