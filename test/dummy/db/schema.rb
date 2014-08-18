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

ActiveRecord::Schema.define(:version => 20140730161721) do

  create_table "columns", :force => true do |t|
    t.integer  "universe_id",       :null => false
    t.string   "nme_termo",         :null => false
    t.string   "dsc_termo",         :null => false
    t.string   "tpo_dado"
    t.string   "tpo_objeto"
    t.string   "sta_coluna_filtro"
    t.string   "sta_obrigado"
    t.text     "dsc_sql_valores"
    t.string   "txt_apresentacao"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "universes", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.text     "sql"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
