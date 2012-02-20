class Anredewert < ActiveRecord::Base
	self.table_name = "anredewerte"
	
	has_many :personen
end
