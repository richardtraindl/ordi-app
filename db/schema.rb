# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120210144514) do

  create_table "abfragen", :force => true do |t|
    t.string "bezeichnung", :null => false
    t.string "bedingung",   :null => false
  end

  create_table "anredewerte", :force => true do |t|
    t.string "wert", :limit => 10, :null => false
  end

  create_table "behandlungen", :force => true do |t|
    t.integer  "tier_id",                                                            :null => false
    t.datetime "behandlungsdatum",                :default => '2012-03-18 17:40:43', :null => false
    t.string   "gewicht_kg",       :limit => 20
    t.text     "diagnose"
    t.string   "laborwerte1",      :limit => 200
    t.string   "laborwerte2",      :limit => 200
    t.string   "arzneien",         :limit => 200
    t.string   "arzneimittel",     :limit => 100
    t.string   "impfungen_extern", :limit => 100
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

  create_table "geschlechtswerte", :force => true do |t|
    t.string "wert", :limit => 2, :null => false
  end

  create_table "impfungen", :id => false, :force => true do |t|
    t.integer "behandlung_id",   :null => false
    t.integer "impfungswert_id", :null => false
  end

  create_table "impfungswerte", :force => true do |t|
    t.string "wert", :limit => 20, :null => false
  end

  create_table "karteikarten", :force => true do |t|
    t.integer  "person_id",  :null => false
    t.integer  "tier_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kontakte", :force => true do |t|
    t.integer  "kontaktwert_id",               :default => 1, :null => false
    t.integer  "person_id",                                   :null => false
    t.string   "kontakt",        :limit => 50
    t.string   "kontakt_intern", :limit => 50
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "kontaktwerte", :force => true do |t|
    t.string "wert", :limit => 10, :null => false
  end

  create_table "laborwerte", :force => true do |t|
    t.integer "tierart",               :null => false
    t.integer "sortkey"
    t.string  "wert",    :limit => 20, :null => false
  end

  create_table "personen", :force => true do |t|
    t.integer  "anredewert_id",                :default => 0,    :null => false
    t.string   "titel",         :limit => 30
    t.string   "familienname",  :limit => 40
    t.string   "vorname",       :limit => 40
    t.string   "notiz",         :limit => 200
    t.boolean  "kunden_kz",                    :default => true
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "postadressen", :force => true do |t|
    t.integer  "person_id",                :null => false
    t.string   "strasse",    :limit => 40
    t.string   "plz",        :limit => 10
    t.string   "ort",        :limit => 40
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "tiere", :force => true do |t|
    t.string   "tiername",           :limit => 30
    t.string   "tierart",            :limit => 30
    t.string   "rasse",              :limit => 30
    t.string   "farbe",              :limit => 50
    t.string   "viren",              :limit => 50
    t.string   "merkmal",            :limit => 50
    t.date     "geburtsdatum"
    t.integer  "geschlechtswert_id",               :default => 0,    :null => false
    t.string   "chipnr",             :limit => 30
    t.string   "eu_passnr",          :limit => 30
    t.boolean  "patienten_kz",                     :default => true
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",           :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
