class Geschlechtswert < ActiveRecord::Base
	self.table_name = "geschlechtswerte"

	has_many	:tiere
end
