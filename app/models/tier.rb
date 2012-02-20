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
