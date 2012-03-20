# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Anredewert.create! :id => 0, :wert => ""
  Anredewert.create! :id => 1, :wert => "Herr"
  Anredewert.create! :id => 2, :wert => "Frau"
  Anredewert.create! :id => 3, :wert => "Familie"
  Anredewert.create! :id => 4, :wert => "Firma"

	Geschlechtswert.create! :id => 0, :wert => ""
	Geschlechtswert.create! :id => 1, :wert => "m"
	Geschlechtswert.create! :id => 2, :wert => "mk"
	Geschlechtswert.create! :id => 3, :wert => "w"
	Geschlechtswert.create! :id => 4, :wert => "wk"

	Kontaktwert.create! :id => 0, :wert => ""
	Kontaktwert.create! :id => 1, :wert => "Telefon"
	Kontaktwert.create! :id => 2, :wert => "Fax"
	Kontaktwert.create! :id => 3, :wert => "Email"

	Impfungswert.create! :id => 1, :wert => "RCP"
	Impfungswert.create! :id => 2, :wert => "Leukose"
	Impfungswert.create! :id => 3, :wert => "FIP"
	Impfungswert.create! :id => 4, :wert => "TW"
	Impfungswert.create! :id => 5, :wert => "SP"
	Impfungswert.create! :id => 6, :wert => "SHLP"
	Impfungswert.create! :id => 7, :wert => "SHLPPi"
	Impfungswert.create! :id => 8, :wert => "SHLPPiT"
	Impfungswert.create! :id => 9, :wert => "Borreliose"
	Impfungswert.create! :id => 10, :wert => "Bpi"
	Impfungswert.create! :id => 11, :wert => "Myxo"
	Impfungswert.create! :id => 12, :wert => "RHD"
	Impfungswert.create! :id => 13, :wert => "Leptospir"
	
	# Katze
	Laborwert.create! :tierart => 1, :sortkey => 0, :wert => "***KATZE***"
	Laborwert.create! :tierart => 1, :sortkey => 1, :wert => "Gluc (71-148)"
	Laborwert.create! :tierart => 1, :sortkey => 2, :wert => "Bun (17-33)"
	Laborwert.create! :tierart => 1, :sortkey => 3, :wert => "Crea (0,8-1,8)"
	Laborwert.create! :tierart => 1, :sortkey => 4, :wert => "Phos (2,6-6)"
	Laborwert.create! :tierart => 1, :sortkey => 5, :wert => "GPT (22-84)"
	Laborwert.create! :tierart => 1, :sortkey => 6, :wert => "GOT (18-51)"
	Laborwert.create! :tierart => 1, :sortkey => 7, :wert => "Bil (0,1-0,4)"
	Laborwert.create! :tierart => 1, :sortkey => 8, :wert => "ALP (38-165)"
	Laborwert.create! :tierart => 1, :sortkey => 9, :wert => "Amyl (200-1900)"
	Laborwert.create! :tierart => 1, :sortkey => 10, :wert => "CK (97-309)"
	Laborwert.create! :tierart => 1, :sortkey => 11, :wert => "K (3,4-4,6)"
	Laborwert.create! :tierart => 1, :sortkey => 12, :wert => "TP (5,7-7,8)"
	Laborwert.create! :tierart => 1, :sortkey => 13, :wert => "T4 (13-50)"
	Laborwert.create! :tierart => 1, :sortkey => 14, :wert => "WBC (5-11)"
	Laborwert.create! :tierart => 1, :sortkey => 15, :wert => "RBC (5-10)"
	Laborwert.create! :tierart => 1, :sortkey => 16, :wert => "HK (27-47)"
	Laborwert.create! :tierart => 1, :sortkey => 17, :wert => "Hb (8-17)"
	Laborwert.create! :tierart => 1, :sortkey => 18, :wert => "Gran (3-12)"
	Laborwert.create! :tierart => 1, :sortkey => 18, :wert => "Lym (1-4)"
	Laborwert.create! :tierart => 1, :sortkey => 20, :wert => "Mon (0-0,5)"
	Laborwert.create! :tierart => 1, :sortkey => 21, :wert => "PLT (180-430)"
	Laborwert.create! :tierart => 1, :sortkey => 22, :wert => "Ka (3,4-4,6)"
	Laborwert.create! :tierart => 1, :sortkey => 23, :wert => "Na (147-156)"
	Laborwert.create! :tierart => 1, :sortkey => 24, :wert => "Cl (107-120)"

	# Hund
	Laborwert.create! :tierart => 2, :sortkey => 50, :wert => "***HUND***"
	Laborwert.create! :tierart => 2, :sortkey => 51, :wert => "Gluc (75-128)"
	Laborwert.create! :tierart => 2, :sortkey => 52, :wert => "Bun (9-29)"
	Laborwert.create! :tierart => 2, :sortkey => 53, :wert => "Crea (0,4-1,4)"
	Laborwert.create! :tierart => 2, :sortkey => 54, :wert => "Phos (1,9-5)"
	Laborwert.create! :tierart => 2, :sortkey => 55, :wert => "GPT (17-78)"
	Laborwert.create! :tierart => 2, :sortkey => 56, :wert => "GOT (17-44)"
	Laborwert.create! :tierart => 2, :sortkey => 57, :wert => "GGT (5-14)"
	Laborwert.create! :tierart => 2, :sortkey => 58, :wert => "Bil (0,1-0,5)"
	Laborwert.create! :tierart => 2, :sortkey => 59, :wert => "ALP (47-254)"
	Laborwert.create! :tierart => 2, :sortkey => 60, :wert => "Amyl (200-1400)"
	Laborwert.create! :tierart => 2, :sortkey => 61, :wert => "CK (49-166)"
	Laborwert.create! :tierart => 2, :sortkey => 62, :wert => "K (3,8-5,0)"
	Laborwert.create! :tierart => 2, :sortkey => 63, :wert => "TP (5,0-7,2)"
	Laborwert.create! :tierart => 2, :sortkey => 64, :wert => "WBC (6-12)"
	Laborwert.create! :tierart => 2, :sortkey => 65, :wert => "RBC (6-9)"
	Laborwert.create! :tierart => 2, :sortkey => 66, :wert => "HK (40-55)"
	Laborwert.create! :tierart => 2, :sortkey => 67, :wert => "Hb (15-19)"
	Laborwert.create! :tierart => 2, :sortkey => 68, :wert => "Gran (1,2-6,8)"
	Laborwert.create! :tierart => 2, :sortkey => 69, :wert => "Lym (1,2-3,2)"
	Laborwert.create! :tierart => 2, :sortkey => 70, :wert => "Mon (0,3-0,8)"
	Laborwert.create! :tierart => 2, :sortkey => 71, :wert => "PLT (150-500)"
	Laborwert.create! :tierart => 2, :sortkey => 72, :wert => "Ka (3,8-5,0)"
	Laborwert.create! :tierart => 2, :sortkey => 73, :wert => "Na (141-152)"
	Laborwert.create! :tierart => 2, :sortkey => 74, :wert => "Cl (102-117)"

	# Kaninchen
	Laborwert.create! :tierart => 3, :sortkey => 100, :wert => "***KANINCHEN***"
	Laborwert.create! :tierart => 3, :sortkey => 101, :wert => "Leukos (5-12)"
	Laborwert.create! :tierart => 3, :sortkey => 102, :wert => "HK (33-48)"
	Laborwert.create! :tierart => 3, :sortkey => 103, :wert => "Gluc (115-214)"
	Laborwert.create! :tierart => 3, :sortkey => 104, :wert => "Bun (11-28)"
	Laborwert.create! :tierart => 3, :sortkey => 105, :wert => "Crea (0,6-1,4)"
	Laborwert.create! :tierart => 3, :sortkey => 106, :wert => "GPT (12-72)"
	Laborwert.create! :tierart => 3, :sortkey => 107, :wert => "GGT (5-18)"
	Laborwert.create! :tierart => 3, :sortkey => 108, :wert => "Bil (0,1-0,4)"
	Laborwert.create! :tierart => 3, :sortkey => 109, :wert => "ALP (21-75)"
	Laborwert.create! :tierart => 3, :sortkey => 110, :wert => "TP (4,9-6,9)"
	Laborwert.create! :tierart => 3, :sortkey => 111, :wert => "Calc (12,-14,5)"


  Abfrage.create! :id => 1, :bezeichnung => "Adresse", :bedingung => "postadressen.strasse LIKE ?"
  Abfrage.create! :id => 2, :bezeichnung => "Arznei", :bedingung => "behandlungen.arzneien LIKE ?"
  Abfrage.create! :id => 3, :bezeichnung => "Arzneimittel", :bedingung => "behandlungen.arzneimittel LIKE ?"
  Abfrage.create! :id => 4, :bezeichnung => "Behandlungen (von-bis)", :bedingung => "behandlungen.behandlungsdatum BETWEEN ? AND ?"
  Abfrage.create! :id => 5, :bezeichnung => "Chipnr.", :bedingung => "tiere.chipnr LIKE ?"
  Abfrage.create! :id => 6, :bezeichnung => "Diagnose", :bedingung => "behandlungen.diagnose LIKE ?"
  Abfrage.create! :id => 7, :bezeichnung => "EU-Passnr.", :bedingung => "tiere.eu_passnr LIKE ?"
  Abfrage.create! :id => 8, :bezeichnung => "Familienname", :bedingung => "personen.familienname LIKE ?"
  Abfrage.create! :id => 9, :bezeichnung => "Finanzamt (von-bis)", :bedingung => "behandlungen.behandlungsdatum BETWEEN ? AND ? AND tiere.merkmal NOT LIKE 'Abzeichen%'"
  Abfrage.create! :id => 10, :bezeichnung => "Impfungen (von-bis)", :bedingung => "behandlungen.behandlungsdatum BETWEEN ? AND ? AND impfungswerte.wert LIKE '%'"
  Abfrage.create! :id => 11, :bezeichnung => "Impfung", :bedingung => "impfungswerte.wert LIKE ?"
  Abfrage.create! :id => 12, :bezeichnung => "Merkmal", :bedingung => "tiere.merkmal LIKE ?"
  Abfrage.create! :id => 13, :bezeichnung => "Postleitzahl", :bedingung => "postadressen.plz LIKE ?"
  Abfrage.create! :id => 14, :bezeichnung => "Rasse", :bedingung => "tiere.rasse LIKE ?"
  Abfrage.create! :id => 15, :bezeichnung => "Telefonnr.", :bedingung => "kontakte.kontakt LIKE ?"
  Abfrage.create! :id => 16, :bezeichnung => "Tierart", :bedingung => "tiere.tierart LIKE ?"
  Abfrage.create! :id => 17, :bezeichnung => "Tiername", :bedingung => "tiere.tiername LIKE ?"

  User.create! :username => "Elfi", :password => ""
  User.create! :username => "Gerold", :password => "dummy"
  User.create! :username => "Gast", :password => "dummy"
  User.create! :username => "Administrator", :password => "dummy"


#1. Karteikarte*************************************************************
person = Person.create!({:anredewert_id => 1, 
                    :titel => "", 
                    :familienname => "Mayer",
                    :vorname => "Kurt",
                    :notiz => ""})

Postadresse.create!(:person_id => person.id,
                    :strasse => "Dr. Karl Renner Ring 2/7",
                    :plz => "1010",
                    :ort => "Wien")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "000111",
                :kontakt_intern  => "")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "222444",
                :kontakt_intern  => "")

tier = Tier.create!(:tiername => "Flocki",
                    :tierart => "Hund",
                    :rasse => "Terrier",
                    :farbe => "",
                    :viren => "",
                    :merkmal => "",
                    :geburtsdatum => nil,
                    :geschlechtswert_id => 2,
                    :chipnr => "",
                    :eu_passnr => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "14.02.2009",
                                :gewicht_kg => "4",
                                :diagnose => "Vorsorge",
                                :laborwerte1 => "XXX",
                                :laborwerte2 => "xxx",
                                :arzneien => "Cortison",
                                :arzneimittel => "Arnica",
                                :impfungen_extern => "")

Impfung.create!(:behandlung_id => tier.behandlungen[0].id, :impfungswert_id => 3)
Impfung.create!(:behandlung_id => tier.behandlungen[0].id, :impfungswert_id => 7)

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "02.06.2011",
                                :gewicht_kg => "5",
                                :diagnose => "2. Vorsorge",
                                :laborwerte1 => "yyy",
                                :laborwerte2 => "yy",
                                :arzneien => "",
                                :arzneimittel => "Arnica D3",
                                :impfungen_extern => "")


Karteikarte.create!(:person_id => person.id, :tier_id => tier.id)

#2. Karteikarte*************************************************************
person = Person.create!({:anredewert_id => 2, 
                    :titel => "Mag.", 
                    :familienname => "Fehringer",
                    :vorname => "Annemarie",
                    :notiz => ""})

Postadresse.create!(:person_id => person.id,
                    :strasse => "Linzerstr. 345/3/4/22",
                    :plz => "1140",
                    :ort => "Wien")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "0664/777444",
                :kontakt_intern  => "")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "",
                :kontakt_intern  => "")

tier = Tier.create!(:tiername => "Jeremi",
                    :tierart => "Katze",
                    :rasse => "",
                    :farbe => "Schwarz",
                    :viren => "",
                    :merkmal => "",
                    :geburtsdatum => "01.02.2008",
                    :geschlechtswert_id => 2,
                    :chipnr => "",
                    :eu_passnr => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "14.07.2010",
                                :gewicht_kg => "6",
                                :diagnose => "Vorsorge",
                                :laborwerte1 => "",
                                :laborwerte2 => "",
                                :arzneien => "",
                                :arzneimittel => "Sepia D00",
                                :impfungen_extern => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "12.12.2012",
                                :gewicht_kg => "",
                                :diagnose => "Durchfall",
                                :laborwerte1 => "",
                                :laborwerte2 => "",
                                :arzneien => "",
                                :arzneimittel => "",
                                :impfungen_extern => "")

Impfung.create!(:behandlung_id => tier.behandlungen[0].id, :impfungswert_id => 4)

Karteikarte.create!(:person_id => person.id, :tier_id => tier.id)

#3. Karteikarte*************************************************************
person = Person.create!({:anredewert_id => 2, 
                    :titel => "", 
                    :familienname => "Breuer",
                    :vorname => "Susanna",
                    :notiz => ""})

Postadresse.create!(:person_id => person.id,
                    :strasse => "Mahlerstr. 21/3/23",
                    :plz => "1010",
                    :ort => "Wien")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "0650/159951",
                :kontakt_intern  => "")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "01/522-12-13",
                :kontakt_intern  => "")

tier = Tier.create!(:tiername => "Hansi",
                    :tierart => "Wellensittich",
                    :rasse => "",
                    :farbe => "",
                    :viren => "",
                    :merkmal => "",
                    :geburtsdatum => nil,
                    :geschlechtswert_id => 3,
                    :chipnr => "",
                    :eu_passnr => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "30.03.2011",
                                :gewicht_kg => "0,16",
                                :diagnose => "Vorsorge",
                                :laborwerte1 => "",
                                :laborwerte2 => "",
                                :arzneien => "",
                                :arzneimittel => "Belladonna C100",
                                :impfungen_extern => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "15.05.2011",
                                :gewicht_kg => "",
                                :diagnose => "",
                                :laborwerte1 => "yyy",
                                :laborwerte2 => "yy",
                                :arzneien => "",
                                :arzneimittel => "",
                                :impfungen_extern => "")


Karteikarte.create!(:person_id => person.id, :tier_id => tier.id)


#4. Karteikarte*************************************************************
tier = Tier.create!(:tiername => "Susi",
                    :tierart => "Hund",
                    :rasse => "Pudel",
                    :farbe => "",
                    :viren => "",
                    :merkmal => "",
                    :geburtsdatum => nil,
                    :geschlechtswert_id => 3,
                    :chipnr => "",
                    :eu_passnr => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "01.04.2011",
                                :gewicht_kg => "7",
                                :diagnose => "Vorsorge",
                                :laborwerte1 => "",
                                :laborwerte2 => "",
                                :arzneien => "",
                                :arzneimittel => "",
                                :impfungen_extern => "")

Impfung.create!(:behandlung_id => tier.behandlungen[0].id, :impfungswert_id => 8)
Impfung.create!(:behandlung_id => tier.behandlungen[0].id, :impfungswert_id => 9)

Karteikarte.create!(:person_id => person.id, :tier_id => tier.id)

#*********************************************************************
person = Person.create!({:anredewert_id => 0, 
                    :titel => "", 
                    :familienname => "Mauracher",
                    :vorname => "Anton",
                    :notiz => ""})

Postadresse.create!(:person_id => person.id,
                    :strasse => "Hauptstr. 47",
                    :plz => "2020",
                    :ort => "Stockerau")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "0664/774411",
                :kontakt_intern  => "")

Kontakt.create!(:kontaktwert_id => 1,
                :person_id => person.id,
                :kontakt => "",
                :kontakt_intern  => "")

tier = Tier.create!(:tiername => "Romeo",
                    :tierart => "Pferd",
                    :rasse => "",
                    :farbe => "",
                    :viren => "",
                    :merkmal => "",
                    :geburtsdatum => nil,
                    :geschlechtswert_id => 2,
                    :chipnr => "",
                    :eu_passnr => "")

behandlung = Behandlung.create!(:tier_id => tier.id,
                                :behandlungsdatum => "17.08.2011",
                                :gewicht_kg => "",
                                :diagnose => "Vorsorge",
                                :laborwerte1 => "ZZZ",
                                :laborwerte2 => "zz",
                                :arzneien => "",
                                :arzneimittel => "",
                                :impfungen_extern => "")


Karteikarte.create!(:person_id => person.id, :tier_id => tier.id)


