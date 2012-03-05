# == Schema Information
#
# Table name: karteikarten
#
#  id         :integer         not null, primary key
#  person_id  :integer         not null
#  tier_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Karteikarte < ActiveRecord::Base
	self.table_name = "karteikarten"

	belongs_to :person
	belongs_to :tier
end
