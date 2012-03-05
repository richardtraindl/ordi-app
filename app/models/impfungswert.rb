# == Schema Information
#
# Table name: impfungswerte
#
#  id   :integer         not null, primary key
#  wert :string(20)      not null
#

class Impfungswert < ActiveRecord::Base
	self.table_name = "impfungswerte"

	has_and_belongs_to_many :behandlungen, :join_table => "impfungen"
	
end
