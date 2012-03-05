# == Schema Information
#
# Table name: tiere
#
#  id                 :integer         not null, primary key
#  tiername           :string(30)
#  tierart            :string(30)
#  rasse              :string(30)
#  farbe              :string(50)
#  viren              :string(50)
#  merkmal            :string(50)
#  geburtsdatum       :date
#  geschlechtswert_id :integer         default(0), not null
#  chipnr             :string(30)
#  eu_passnr          :string(30)
#  patienten_kz       :boolean         default(TRUE)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class Tier < ActiveRecord::Base
	self.table_name = "tiere"

	has_and_belongs_to_many	:personen, :join_table => "karteikarten" #, :class_name => "Karteikarte"
	belongs_to				:geschlechtswert
	has_many				:behandlungen, :dependent => :destroy

	accepts_nested_attributes_for :behandlungen, :allow_destroy => true
	
	
	include FormatHelper ### fix: move format helper to lib/format    
	
	#def therapies_attributes=(attr)
	#puts "############################"
#		puts attr
#	end

	def geburtsdatum_str
		@geburtsdatum_str || fmt_date( self.geburtsdatum )
	end
  
	def geburtsdatum_str=(value)
		value = value.strip     

		# 1) do sanity checking here
		if value =~ /(\d{2})(\d{2})(\d{4})/      # allow entry without delimiters/separators eg. 25081972
		  value = "#{$1}.#{$2}.#{$3}"
		elsif value =~ /(\d{1,2})[\.\-\/ ](\d{1,2})[\.\-\/ ](\d{4})/   # allow entry with delimiters (.-/ ) e.g. 25/8/1972 oder 25 8 1972
		  value = "#{$1}.#{$2}.#{$3}"
		end 

		@geburtsdatum_str = value

		# 2) also write it to date typed attribute
		# and hand it back to rails to convert and store
		write_attribute( :geburtsdatum, value )
  end
      
end
