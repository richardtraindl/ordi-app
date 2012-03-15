class CreateDb < ActiveRecord::Migration
  def up
    create_table :karteikarten do |t|
      t.references :person, :null => false
      t.references :tier, :null => false

      t.timestamps
    end

  	create_table :personen do |t|
    	t.references		:anredewert, :null => false, :default => 0
    	t.string			:titel, :limit => 30
    	t.string			:familienname, :limit => 40
    	t.string			:vorname, :limit => 40
			t.string			:notiz, :limit => 200
    	t.boolean			:kunden_kz, :default => true
		
			t.timestamps
    end

    create_table :anredewerte do |t|
			t.string	:wert, :limit => 10, :null => false
    end

    create_table :postadressen do |t|
    	t.references		:person, :null => false
    	t.string			:strasse, :limit =>40
    	t.string			:plz, :limit => 10
    	t.string			:ort, :limit => 40
		
			t.timestamps
    end	
	
		create_table :kontaktwerte do |t|
			t.string	:wert, :limit => 10, :null => false
    end

		create_table :kontakte do |t|
			t.references	:kontaktwert, :null => false, :default => 1
			t.references	:person, :null => false
			t.string		:kontakt, :limit => 50
			t.string		:kontakt_intern, :limit => 50
		
			t.timestamps
    end

    create_table :tiere do |t|
			t.string			:tiername, :limit => 30
	    t.string			:tierart, :limit => 30
	    t.string			:rasse, :limit => 30
	    t.string			:farbe, :limit => 50
	    t.string			:viren, :limit => 50
	    t.string			:merkmal, :limit => 50
	    t.date				:geburtsdatum
	    t.references		:geschlechtswert, :null => false, :default => 0
	    t.string			:chipnr, :limit => 30
	    t.string			:eu_passnr, :limit => 30
	    t.boolean			:patienten_kz, :default => true
		
			t.timestamps
    end

		create_table :geschlechtswerte do |t|
			t.string	:wert, :limit => 2, :null => false
    end


    create_table :behandlungen do |t|
			t.references	:tier, :null => false
			t.datetime		:behandlungsdatum, :null => false, :default => DateTime.now
			t.string		:gewicht_kg, :limit => 20
			t.text			:diagnose
			t.string		:laborwerte1, :limit => 200
			t.string		:laborwerte2, :limit => 200
			t.string		:arzneien, :limit => 200
			t.string		:arzneimittel, :limit => 100
			t.string		:impfungen_extern, :limit => 100
		
			t.timestamps
    end		

		create_table :impfungswerte do |t|
			t.string	:wert, :limit => 20, :null => false		
		end	

		create_table :impfungen, :id => false do |t|
		  t.references	:behandlung, :null => false
		  t.references	:impfungswert, :null => false
		end

		create_table :laborwerte do |t|
			t.integer	:tierart, :null => false # 1 = Katze, 2 = Hund, 3 = Kaninchen
			t.integer	:sortkey, :uniqueness => true
			t.string	:wert, :limit => 20, :null => false
		end

	  create_table :abfragen do |t|
			t.string	:bezeichnung, :null => false
			t.string	:bedingung, :null => false
    end

	  create_table :users do |t|
			t.string	:username, :null => false, :uniqueness => true
      t.string	:encrypted_password
      t.string  :salt
      
      t.timestamps
    end

  end

  def down
  end
end
