module FormatHelper

  def fmt_euro( value )
    number_to_currency( value, :unit => '', :separator => ',', :delimiter => '.' )
  end

  def fmt_date( value )
    return '' if value.nil?
    value.strftime( '%d.%m.%Y' )
  end

  def fmt_str_date( value )
    ## fix: add String class check to fmt_date
    value.blank? ? '' : fmt_date(DateTime.parse(value))
  end
  
end