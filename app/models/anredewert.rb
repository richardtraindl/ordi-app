# == Schema Information
#
# Table name: anredewerte
#
#  id   :integer         not null, primary key
#  wert :string(10)      not null
#

class Anredewert < ActiveRecord::Base
	self.table_name = "anredewerte"
  
	has_many :personen
  
  
  def self.anrede(key)
  	self.find(:first, :conditions => ["key = ?", key]).wert
  end
  
end
