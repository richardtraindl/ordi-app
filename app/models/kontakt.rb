# == Schema Information
#
# Table name: kontakte
#
#  id             :integer         not null, primary key
#  kontaktwert_id :integer         default(1), not null
#  person_id      :integer         not null
#  kontakt        :string(50)
#  kontakt_intern :string(50)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Kontakt < ActiveRecord::Base
	self.table_name = "kontakte"

	belongs_to	:person
	belongs_to 	:kontaktwert
end
