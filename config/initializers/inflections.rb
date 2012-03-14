# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular   'karteikarte', 'karteikarten'
    inflect.irregular   'person', 'personen'
    inflect.irregular   'anredewert', 'anredewerte'
    inflect.irregular   'postadresse', 'postadressen'
    inflect.irregular   'kontakt', 'kontakte'
    inflect.irregular   'kontaktwert', 'kontaktwerte'    
    inflect.irregular   'tier', 'tiere'
    inflect.irregular   'geschlechtswert', 'geschlechtswerte'
    inflect.irregular   'behandlung', 'behandlungen'
		inflect.irregular   'impfungswert', 'impfungswerte'
		inflect.irregular   'impfung', 'impfungen'
		inflect.irregular   'laborwert', 'laborwerte'
		inflect.irregular   'abfrage', 'abfragen'
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
