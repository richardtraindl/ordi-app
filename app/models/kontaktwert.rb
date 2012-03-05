# == Schema Information
#
# Table name: kontaktwerte
#
#  id   :integer         not null, primary key
#  wert :string(10)      not null
#

class Kontaktwert < ActiveRecord::Base
	self.table_name = "kontaktwerte"
	
	has_many 	:kontakte
end
