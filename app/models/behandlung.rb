class Behandlung < ActiveRecord::Base
	self.table_name = "behandlungen"
	
	belongs_to 						:tier
	has_and_belongs_to_many 		:impfungswerte # , :dependent => :destroy	

	#accepts_nested_attributes_for :impfungswerte
	
	include FormatHelper ### fix: move format helper to lib/format    

	def behandlungsdatum_str
		@behandlungsdatum_str || fmt_date( self.behandlungsdatum )
	end
  
	def behandlungsdatum_str=(value)
		value = value.strip     

		# 1) do sanity checking here
		if value =~ /(\d{2})(\d{2})(\d{4})/      # allow entry without delimiters/separators eg. 25081972
		  value = "#{$1}.#{$2}.#{$3}"
		elsif value =~ /(\d{1,2})[\.\-\/ ](\d{1,2})[\.\-\/ ](\d{4})/   # allow entry with delimiters (.-/ ) e.g. 25/8/1972 oder 25 8 1972
		  value = "#{$1}.#{$2}.#{$3}"
		end 

		@behandlungsdatum_str = value

		# 2) also write it to date typed attribute
		# and hand it back to rails to convert and store
		write_attribute( :behandlungsdatum, value )
  end
end
