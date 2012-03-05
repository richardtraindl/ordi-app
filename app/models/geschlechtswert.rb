# == Schema Information
#
# Table name: geschlechtswerte
#
#  id   :integer         not null, primary key
#  wert :string(2)       not null
#

class Geschlechtswert < ActiveRecord::Base
	self.table_name = "geschlechtswerte"

	has_many	:tiere
end
