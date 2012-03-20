module ApplicationHelper
  
  def check_date(value)
    if value.length != 10
      return false
    end
    
		tag   = value[0..1]
		monat = value[3..4]
    jahr  = value[6..9]

    if jahr.to_i < 1900 || monat.to_i < 1 || monat.to_i > 12 || tag.to_i < 1 || tag.to_i > 31
      return false
    end
    
    return true
  end 

end
