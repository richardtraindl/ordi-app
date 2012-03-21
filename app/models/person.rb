# == Schema Information
#
# Table name: personen
#
#  id            :integer         not null, primary key
#  anredewert_id :integer         default(0), not null
#  titel         :string(255)
#  familienname  :string(40)
#  vorname       :string(40)
#  notiz         :string(200)
#  kunden_kz     :boolean         default(TRUE)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Person < ActiveRecord::Base
	self.table_name = "personen"

	has_and_belongs_to_many	:tiere, :join_table => "karteikarten" #, :class_name => "Karteikarte"
	belongs_to				:anredewert, :foreign_key => :key
	has_many				:postadressen, :dependent => :destroy
	has_many				:kontakte # , :dependent => :destroy

	accepts_nested_attributes_for :postadressen
	accepts_nested_attributes_for :kontakte
end
