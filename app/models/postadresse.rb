# == Schema Information
#
# Table name: postadressen
#
#  id         :integer         not null, primary key
#  person_id  :integer         not null
#  strasse    :string(40)
#  plz        :string(10)
#  ort        :string(40)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Postadresse < ActiveRecord::Base
	self.table_name = "postadressen"

	belongs_to :person
end
