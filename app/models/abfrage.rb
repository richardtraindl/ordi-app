# == Schema Information
#
# Table name: abfragen
#
#  id          :integer         not null, primary key
#  bezeichnung :string(255)     not null
#  bedingung   :string(255)     not null
#

class Abfrage < ActiveRecord::Base
	self.table_name = "abfragen"
end
