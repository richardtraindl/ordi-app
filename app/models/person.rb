class Person < ActiveRecord::Base
	self.table_name = "personen"

	has_and_belongs_to_many	:tiere, :join_table => "karteikarten" #, :class_name => "Karteikarte"
	belongs_to				:anredewert
	has_many				:postadressen, :dependent => :destroy
	has_many				:kontakte # , :dependent => :destroy

	accepts_nested_attributes_for :postadressen
	accepts_nested_attributes_for :kontakte
end
