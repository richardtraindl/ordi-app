class Karteikarte < ActiveRecord::Base
	self.table_name = "karteikarten"

	belongs_to :person
	belongs_to :tier
end