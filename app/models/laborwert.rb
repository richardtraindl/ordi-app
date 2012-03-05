# == Schema Information
#
# Table name: laborwerte
#
#  id      :integer         not null, primary key
#  tierart :integer         not null
#  sortkey :integer
#  wert    :string(20)      not null
#

class Laborwert < ActiveRecord::Base
	self.table_name = "laborwerte"
end
