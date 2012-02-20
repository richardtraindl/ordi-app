class Postadresse < ActiveRecord::Base
	self.table_name = "postadressen"

	belongs_to :person
end
