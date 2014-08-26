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

ActiveRecord::Schema.define(:version => 20140826135819) do

  create_table "acts_as_xapian_jobs", :force => true do |t|
    t.string  "model",    :null => false
    t.integer "model_id", :null => false
    t.string  "action",   :null => false
  end

  add_index "acts_as_xapian_jobs", ["model", "model_id"], :name => "index_acts_as_xapian_jobs_on_model_and_model_id", :unique => true

  create_table "columns", :force => true do |t|
    t.integer   "universe_id",                                          :null => false
    t.string    "name",                                                 :null => false
    t.string    "label",                                                :null => false
    t.string    "tpo_dado"
    t.string    "aggregate",                           :default => "D"
    t.boolean   "filterable"
    t.boolean   "mandatory"
    t.text      "sql_values",       :limit => 1048576
    t.string    "txt_apresentacao"
    t.timestamp "created_at",                                           :null => false
    t.timestamp "updated_at",                                           :null => false
  end

  create_table "glb_analise", :primary_key => "sqc_analise", :force => true do |t|
    t.string    "nme_analise",     :limit => 100,   :null => false
    t.string    "dsc_analise",     :limit => 500,   :null => false
    t.string    "txt_sql",         :limit => 15600, :null => false
    t.string    "cdg_sistema",     :limit => 3,     :null => false
    t.integer   "cdg_permissao",                    :null => false
    t.integer   "cdg_usuario_cad",                  :null => false
    t.timestamp "dta_cadastro",                     :null => false
    t.integer   "cdg_usuario_alt"
    t.timestamp "dta_alteracao"
    t.string    "sta_bloqueado",   :limit => 1
  end

  create_table "glb_analise_alt", :id => false, :force => true do |t|
    t.integer   "sqc_analise"
    t.string    "nme_analise",     :limit => 100
    t.string    "dsc_analise",     :limit => 500
    t.string    "txt_sql",         :limit => 15600
    t.string    "cdg_sistema",     :limit => 3
    t.integer   "cdg_permissao"
    t.string    "tpo_operacao",    :limit => 1
    t.integer   "cdg_usuario_alt"
    t.timestamp "dta_alteracao"
  end

  create_table "glb_analise_coluna", :primary_key => "sqc_coluna_analise", :force => true do |t|
    t.integer "sqc_analise",                             :null => false
    t.integer "cdg_termo_implementacao",                 :null => false
    t.string  "tpo_objeto",              :limit => 1,    :null => false
    t.string  "sta_coluna_filtro",       :limit => 1,    :null => false
    t.string  "txt_formula",             :limit => 1000
    t.string  "nme_agrupamento",         :limit => 40
    t.string  "sta_obrigatorio",         :limit => 1
    t.string  "txt_apresentacao",        :limit => 1000
    t.boolean "nmr_intervalo_max"
    t.string  "sta_coluna_campo",        :limit => 1
  end

  create_table "glb_analise_coluna_alt", :id => false, :force => true do |t|
    t.integer   "sqc_coluna_analise",                      :null => false
    t.integer   "sqc_analise",                             :null => false
    t.integer   "cdg_termo_implementacao",                 :null => false
    t.string    "tpo_objeto",              :limit => 1,    :null => false
    t.string    "sta_coluna_filtro",       :limit => 1,    :null => false
    t.string    "txt_formula",             :limit => 1000
    t.string    "nme_agrupamento",         :limit => 40
    t.string    "sta_obrigatorio",         :limit => 1
    t.string    "txt_apresentacao",        :limit => 1000
    t.boolean   "nmr_intervalo_max"
    t.string    "sta_coluna_campo",        :limit => 1
    t.integer   "cdg_usuario_alt",                         :null => false
    t.timestamp "dta_alteracao",                           :null => false
    t.string    "tpo_operacao",            :limit => 1,    :null => false
  end

  create_table "glb_bairro", :primary_key => "cdg_localidade", :force => true do |t|
    t.boolean "cdg_bairro",                   :null => false
    t.string  "dsc_bairro",     :limit => 60, :null => false
    t.string  "dsc_abreviada",  :limit => 30
    t.integer "cdg_bairro_dne"
  end

  add_index "glb_bairro", ["cdg_bairro_dne"], :name => "ak_bar_01"

  create_table "glb_bairro_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_localidade",                :null => false
    t.boolean   "cdg_bairro",                    :null => false
    t.timestamp "dta_alteracao",                 :null => false
    t.string    "nme_usuario_alt", :limit => 20, :null => false
    t.string    "tpo_operacao",    :limit => 1,  :null => false
    t.string    "dsc_bairro",      :limit => 60, :null => false
    t.string    "dsc_abreviada",   :limit => 30
  end

  add_index "glb_bairro_alteracao", ["cdg_localidade", "cdg_bairro"], :name => "fk_bar_baralt"

  create_table "glb_centro_custo", :primary_key => "cdg_centro_custo", :force => true do |t|
    t.string    "dsc_centro_custo",     :limit => 40, :null => false
    t.timestamp "dta_cadastro",                       :null => false
    t.string    "nme_usuario_cad",      :limit => 20, :null => false
    t.boolean   "cdg_centro_custo_sup",               :null => false
    t.string    "nme_fantasia",         :limit => 40
    t.timestamp "dta_alteracao"
    t.string    "nme_usuario_alt",      :limit => 20
  end

  add_index "glb_centro_custo", ["cdg_centro_custo_sup"], :name => "fk_cc_cc"

  create_table "glb_cep", :primary_key => "cdg_localidade", :force => true do |t|
    t.integer "cdg_logradouro",                      :null => false
    t.string  "nmr_cep",               :limit => 8,  :null => false
    t.integer "nmr_par_inicial"
    t.integer "nmr_impar_inicial"
    t.integer "nmr_par_final"
    t.integer "nmr_impar_final"
    t.boolean "cdg_bairro"
    t.string  "nmr_pagina_guia",       :limit => 10
    t.integer "cdg_seccionamento_dne"
  end

  add_index "glb_cep", ["cdg_localidade", "cdg_bairro"], :name => "fk_bar_cep"
  add_index "glb_cep", ["nmr_cep"], :name => "ak_cep_01"

  create_table "glb_cep_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_localidade",                  :null => false
    t.integer   "cdg_logradouro",                  :null => false
    t.string    "nmr_cep",           :limit => 8,  :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "nme_usuario_alt",   :limit => 20, :null => false
    t.string    "tpo_operacao",      :limit => 1,  :null => false
    t.integer   "nmr_par_inicial"
    t.integer   "nmr_impar_inicial"
    t.integer   "nmr_par_final"
    t.integer   "nmr_impar_final"
    t.boolean   "cdg_bairro"
    t.string    "nmr_pagina_guia",   :limit => 10
  end

  add_index "glb_cep_alteracao", ["cdg_localidade", "cdg_logradouro", "nmr_cep"], :name => "fk_cep_cepalt"

  create_table "glb_cep_especial", :primary_key => "cdg_localidade", :force => true do |t|
    t.integer "cdg_logradouro",                :null => false
    t.integer "nmr_endereco",                  :null => false
    t.string  "nmr_cep",         :limit => 8,  :null => false
    t.boolean "cdg_bairro",                    :null => false
    t.string  "nmr_pagina_guia", :limit => 10
  end

  add_index "glb_cep_especial", ["cdg_localidade", "cdg_bairro"], :name => "fk_bar_cepesp"
  add_index "glb_cep_especial", ["cdg_localidade", "cdg_logradouro"], :name => "fk_lgd_cepesp"
  add_index "glb_cep_especial", ["nmr_cep"], :name => "ak_cepesp_01"

  create_table "glb_cep_especial_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_localidade",                :null => false
    t.integer   "cdg_logradouro",                :null => false
    t.integer   "nmr_endereco",                  :null => false
    t.timestamp "dta_alteracao",                 :null => false
    t.string    "nme_usuario_alt", :limit => 20, :null => false
    t.string    "tpo_operacao",    :limit => 1,  :null => false
    t.string    "nmr_cep",         :limit => 8,  :null => false
    t.boolean   "cdg_bairro",                    :null => false
    t.string    "nmr_pagina_guia", :limit => 10
  end

  add_index "glb_cep_especial_alteracao", ["cdg_localidade", "cdg_logradouro", "nmr_endereco"], :name => "fk_cepesp_cepesa"

  create_table "glb_configuracao", :primary_key => "cdg_objeto", :force => true do |t|
    t.integer   "cdg_termo_implementacao",                 :null => false
    t.string    "dsc_valor",               :limit => 1500, :null => false
    t.timestamp "dta_cadastro",                            :null => false
    t.integer   "cdg_usuario_cad",                         :null => false
    t.integer   "cdg_usuario_alt"
  end

  create_table "glb_configuracao_alt", :id => false, :force => true do |t|
    t.integer   "cdg_objeto",                              :null => false
    t.integer   "cdg_termo_implementacao",                 :null => false
    t.timestamp "dta_alteracao",                           :null => false
    t.string    "tpo_alteracao",           :limit => 1,    :null => false
    t.string    "dsc_valor",               :limit => 1500, :null => false
    t.integer   "cdg_usuario_alt",                         :null => false
  end

  add_index "glb_configuracao_alt", ["cdg_objeto", "cdg_termo_implementacao"], :name => "ak_confalt_01"

  create_table "glb_diretorio", :primary_key => "cdg_diretorio", :force => true do |t|
    t.string    "nme_diretorio",     :limit => 100, :null => false
    t.boolean   "cdg_diretorio_sup"
    t.string    "cdg_sistema",       :limit => 3,   :null => false
    t.integer   "cdg_usuario_cad",                  :null => false
    t.timestamp "dta_cadastro",                     :null => false
    t.string    "cdg_identificacao", :limit => 3
    t.integer   "cdg_usuario_alt",                  :null => false
  end

  add_index "glb_diretorio", ["cdg_identificacao"], :name => "ak_dir_01"

  create_table "glb_diretorio_alt", :id => false, :force => true do |t|
    t.boolean   "cdg_diretorio",                    :null => false
    t.string    "nme_diretorio",     :limit => 100, :null => false
    t.boolean   "cdg_diretorio_sup"
    t.string    "cdg_sistema",       :limit => 3,   :null => false
    t.string    "cdg_identificacao", :limit => 3,   :null => false
    t.integer   "cdg_usuario_alt",                  :null => false
    t.timestamp "dta_alteracao",                    :null => false
    t.string    "tpo_operacao",      :limit => 1,   :null => false
  end

  create_table "glb_dominio", :primary_key => "nme_tabela", :force => true do |t|
    t.string  "nme_coluna",   :limit => 30,  :null => false
    t.string  "dsc_valor",    :limit => 10,  :null => false
    t.string  "dsc_conteudo", :limit => 100, :null => false
    t.integer "nmr_ordem"
  end

  create_table "glb_erro", :primary_key => "cdg_erro", :force => true do |t|
    t.string "cdg_sistema", :limit => 3,   :null => false
    t.string "dsc_erro",    :limit => 150, :null => false
  end

  create_table "glb_especialidade", :primary_key => "cdg_especialidade", :force => true do |t|
    t.string  "dsc_especialidade",  :limit => 40, :null => false
    t.boolean "cdg_ramo_atividade",               :null => false
  end

  add_index "glb_especialidade", ["cdg_ramo_atividade"], :name => "fk_rmoatv_esp"

  create_table "glb_estado", :primary_key => "cdg_estado", :force => true do |t|
    t.string  "dsc_estado", :limit => 30, :null => false
    t.boolean "cdg_pais",                 :null => false
    t.string  "dsc_sigla",  :limit => 5
    t.string  "dsc_regiao", :limit => 15
  end

  add_index "glb_estado", ["cdg_pais"], :name => "fk_pai_etd"

  create_table "glb_fuso_horario", :primary_key => "cdg_fuso", :force => true do |t|
    t.string  "dsc_fuso",                  :limit => 50, :null => false
    t.string  "sta_observa_horario_verao", :limit => 1,  :null => false
    t.boolean "qtd_mnt_fuso",                            :null => false
  end

  create_table "glb_fuso_horario_verao", :primary_key => "cdg_fuso", :force => true do |t|
    t.date "dta_periodo_inicial", :null => false
    t.date "dta_periodo_final"
  end

  create_table "glb_grupo", :primary_key => "cdg_grupo", :force => true do |t|
    t.string "dsc_grupo", :limit => 30, :null => false
  end

  create_table "glb_grupo_agrupamento", :primary_key => "cdg_grupo_agrupamento", :force => true do |t|
    t.string "dsc_grupo_agrupamento", :limit => 30, :null => false
  end

  create_table "glb_grupo_atalho", :primary_key => "cdg_grupo_atalho", :force => true do |t|
    t.string    "nme_grupo_atalho", :limit => 30,    :null => false
    t.string    "dsc_atalho",       :limit => 15000, :null => false
    t.string    "sta_publicado",    :limit => 1
    t.timestamp "dta_cadastro",                      :null => false
    t.integer   "cdg_usuario_cad",                   :null => false
    t.string    "tpo_fixo",         :limit => 1
    t.string    "tpo_campo",        :limit => 1
    t.string    "nmr_ordem",        :limit => 1
  end

  create_table "glb_idioma", :primary_key => "cdg_idioma", :force => true do |t|
    t.string "dsc_idioma", :limit => 20, :null => false
  end

  create_table "glb_localidade", :primary_key => "cdg_localidade", :force => true do |t|
    t.string  "dsc_localidade",     :limit => 60, :null => false
    t.boolean "cdg_estado",                       :null => false
    t.string  "tpo_localidade",     :limit => 1,  :null => false
    t.string  "dsc_sigla",          :limit => 5
    t.boolean "nmr_ddd"
    t.integer "cdg_localidade_sup"
    t.integer "cdg_localidade_dne"
    t.string  "cdg_fuso",           :limit => 5,  :null => false
  end

  add_index "glb_localidade", ["cdg_estado"], :name => "fk_etd_lcd"
  add_index "glb_localidade", ["cdg_localidade", "nmr_ddd"], :name => "ak_lcd_02"
  add_index "glb_localidade", ["cdg_localidade_dne"], :name => "ak_lcd_03"
  add_index "glb_localidade", ["cdg_localidade_sup"], :name => "fk_lcd_lcd"
  add_index "glb_localidade", ["dsc_localidade"], :name => "ak_lcd_01"

  create_table "glb_localidade_prefixo", :primary_key => "nmr_ddd", :force => true do |t|
    t.boolean "nmr_prefixo",        :null => false
    t.boolean "nmr_sufixo_inicial", :null => false
    t.boolean "nmr_sufixo_final",   :null => false
    t.integer "cdg_localidade",     :null => false
  end

  add_index "glb_localidade_prefixo", ["cdg_localidade", "nmr_ddd"], :name => "fk_lcd_lcdpfx"

  create_table "glb_logradouro", :primary_key => "cdg_localidade", :force => true do |t|
    t.integer   "cdg_logradouro",                      :null => false
    t.timestamp "dta_alteracao",                       :null => false
    t.string    "nme_usuario_alt",       :limit => 20, :null => false
    t.string    "dsc_logradouro",        :limit => 60, :null => false
    t.boolean   "cdg_tipo_logradouro",                 :null => false
    t.string    "dsc_tipo_logradouro",   :limit => 20, :null => false
    t.boolean   "cdg_titulo_logradouro"
    t.string    "dsc_titulo_logradouro", :limit => 25
    t.integer   "cdg_logradouro_dne"
    t.integer   "cdg_logradouro_telebv"
    t.integer   "cdg_lote_dne"
    t.integer   "cdg_complemento_dne"
  end

  add_index "glb_logradouro", ["cdg_localidade", "dsc_logradouro"], :name => "ak_lgd_01"
  add_index "glb_logradouro", ["cdg_logradouro_dne", "cdg_lote_dne", "cdg_complemento_dne"], :name => "ak_lgd_02"
  add_index "glb_logradouro", ["cdg_logradouro_telebv"], :name => "ak_lgd_03"
  add_index "glb_logradouro", ["cdg_tipo_logradouro"], :name => "fk_tpolgd_lgd"
  add_index "glb_logradouro", ["cdg_titulo_logradouro"], :name => "fk_ttolgd_lgd"

  create_table "glb_logradouro_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_localidade",                      :null => false
    t.integer   "cdg_logradouro",                      :null => false
    t.timestamp "dta_alteracao",                       :null => false
    t.string    "nme_usuario_alt",       :limit => 20, :null => false
    t.string    "tpo_operacao",          :limit => 1,  :null => false
    t.string    "dsc_logradouro",        :limit => 60, :null => false
    t.boolean   "cdg_tipo_logradouro",                 :null => false
    t.string    "dsc_tipo_logradouro",   :limit => 20, :null => false
    t.boolean   "cdg_titulo_logradouro"
    t.string    "dsc_titulo_logradouro", :limit => 25
  end

  add_index "glb_logradouro_alteracao", ["cdg_localidade", "cdg_logradouro"], :name => "fk_lgd_lgdalt"

  create_table "glb_nivel_relacionamento", :primary_key => "cdg_nivel_relacionamento", :force => true do |t|
    t.string "dsc_nivel_relacionamento", :limit => 30, :null => false
  end

  create_table "glb_notificacao", :primary_key => "sqc_notificacao", :force => true do |t|
    t.string    "dsc_notificacao", :limit => 1000, :null => false
    t.string    "tpo_notificacao", :limit => 1,    :null => false
    t.date      "dta_inicial",                     :null => false
    t.date      "dta_final",                       :null => false
    t.string    "nme_usuario",     :limit => 30,   :null => false
    t.timestamp "dta_cadastro",                    :null => false
  end

  create_table "glb_notificacao_hist_acesso", :primary_key => "sqc_notificacao_sistema", :force => true do |t|
    t.integer "cdg_usuario",      :null => false
    t.date    "dta_visualizacao", :null => false
  end

  create_table "glb_notificacao_sistema", :primary_key => "sqc_notificacao_sistema", :force => true do |t|
    t.integer "sqc_notificacao",              :null => false
    t.string  "cdg_sistema",     :limit => 3, :null => false
    t.integer "cdg_perfil"
    t.integer "cdg_unidade"
    t.integer "cdg_regional"
  end

  create_table "glb_notificacao_usuario", :primary_key => "sqc_notificacao_sistema", :force => true do |t|
    t.integer "cdg_usuario",                                         :null => false
    t.string  "sta_mostrar_novamente", :limit => 1, :default => "S", :null => false
  end

  create_table "glb_orgao_lbv", :primary_key => "cdg_orgao_operacional", :force => true do |t|
    t.boolean "cdg_orgao",                       :null => false
    t.boolean "sqc_endereco",                    :null => false
    t.boolean "sqc_telefone"
    t.boolean "cdg_tipo_orgao",                  :null => false
    t.integer "cdg_pessoa",                      :null => false
    t.date    "dta_inscricao",                   :null => false
    t.string  "sta_cgc",           :limit => 1,  :null => false
    t.integer "nmr_cnae"
    t.date    "dta_baixa_cgc"
    t.string  "nme_usuario_baixa", :limit => 20
  end

  add_index "glb_orgao_lbv", ["cdg_pessoa", "sqc_endereco"], :name => "fk_pesend_org"
  add_index "glb_orgao_lbv", ["cdg_pessoa", "sqc_telefone"], :name => "fk_pestlf_org"
  add_index "glb_orgao_lbv", ["cdg_tipo_orgao"], :name => "fk_tpoorg_org"

  create_table "glb_orgao_lbv_alteracao", :primary_key => "cdg_orgao", :force => true do |t|
    t.string    "tpo_alteracao_cgc", :limit => 1,  :null => false
    t.date      "dta_alteracao_cgc",               :null => false
    t.string    "nme_usuario_alt",   :limit => 20, :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "nme_fantasia",      :limit => 50
    t.integer   "cdg_localidade"
    t.integer   "cdg_logradouro"
    t.integer   "nmr_endereco"
    t.string    "dsc_complemento",   :limit => 30
  end

  add_index "glb_orgao_lbv_alteracao", ["cdg_localidade", "cdg_logradouro"], :name => "fk_lgd_orgalt"

  create_table "glb_orgao_operacional", :primary_key => "cdg_orgao_operacional", :force => true do |t|
    t.timestamp "dta_cadastro",                            :null => false
    t.string    "nme_usuario_cad",           :limit => 20, :null => false
    t.boolean   "cdg_tipo_orgao",                          :null => false
    t.integer   "cdg_orgao"
    t.string    "dsc_orgao_operacional",     :limit => 50, :null => false
    t.string    "dsc_orgao_abreviado",       :limit => 20, :null => false
    t.string    "sta_situacao",              :limit => 1,  :null => false
    t.string    "sta_arrecadacao",           :limit => 1
    t.string    "sta_mercadoria",            :limit => 1
    t.boolean   "cdg_orgao_operacional_sup"
    t.boolean   "cdg_conta_email"
    t.string    "cdg_fuso",                  :limit => 5
  end

  add_index "glb_orgao_operacional", ["cdg_orgao"], :name => "fk_org_orgopr"
  add_index "glb_orgao_operacional", ["cdg_orgao_operacional_sup"], :name => "fk_orgopr_orgopr"
  add_index "glb_orgao_operacional", ["cdg_tipo_orgao"], :name => "fk_tpoorg_orgopr"

  create_table "glb_orgao_operacional_alt", :primary_key => "cdg_orgao_operacional", :force => true do |t|
    t.timestamp "dta_alteracao",                            :null => false
    t.string    "nme_usuario_alt",           :limit => 20,  :null => false
    t.string    "tpo_alteracao",             :limit => 240, :null => false
    t.boolean   "cdg_tipo_orgao"
    t.integer   "cdg_orgao"
    t.string    "dsc_orgao_operacional",     :limit => 50
    t.string    "sta_situacao",              :limit => 1,   :null => false
    t.string    "sta_arrecadacao",           :limit => 1
    t.boolean   "cdg_orgao_operacional_sup"
  end

  create_table "glb_orgao_operacional_config", :primary_key => "cdg_orgao_operacional", :force => true do |t|
    t.boolean "cdg_parametro",                       :null => false
    t.boolean "nmr_sequencia",                       :null => false
    t.string  "cdg_parametrizacao",   :limit => 3,   :null => false
    t.string  "dsc_valor_inicial",    :limit => 200, :null => false
    t.string  "dsc_conteudo_inicial", :limit => 200
    t.string  "dsc_valor_final",      :limit => 200
    t.string  "dsc_conteudo_final",   :limit => 200
  end

  add_index "glb_orgao_operacional_config", ["cdg_orgao_operacional"], :name => "fk_orgopr_orgcnf"
  add_index "glb_orgao_operacional_config", ["cdg_parametrizacao", "cdg_parametro"], :name => "fk_przprm_orgcnf"

  create_table "glb_orgao_operacional_lcd", :primary_key => "cdg_orgao_operacional", :force => true do |t|
    t.integer "cdg_localidade", :null => false
  end

  add_index "glb_orgao_operacional_lcd", ["cdg_localidade"], :name => "fk_lcd_orgopl"

  create_table "glb_orgao_operacional_lcd_alt", :id => false, :force => true do |t|
    t.boolean   "cdg_orgao_operacional",               :null => false
    t.integer   "cdg_localidade",                      :null => false
    t.string    "nme_usuario_alt",       :limit => 20
    t.timestamp "dta_alteracao",                       :null => false
    t.string    "tpo_operacao",          :limit => 1,  :null => false
  end

  add_index "glb_orgao_operacional_lcd_alt", ["cdg_orgao_operacional", "cdg_localidade"], :name => "ak_orglca_01"

  create_table "glb_pais", :primary_key => "cdg_pais", :force => true do |t|
    t.string  "dsc_pais",   :limit => 50, :null => false
    t.string  "dsc_sigla",  :limit => 5
    t.boolean "nmr_ddi"
    t.boolean "cdg_idioma"
  end

  create_table "glb_pais_config", :primary_key => "cdg_pais", :force => true do |t|
    t.integer "cdg_termo_implementacao",                :null => false
    t.boolean "nmr_sequencia",                          :null => false
    t.string  "dsc_valor_inicial",       :limit => 200, :null => false
    t.string  "dsc_conteudo_inicial",    :limit => 200
    t.string  "dsc_valor_final",         :limit => 200
    t.string  "dsc_conteudo_final",      :limit => 200
  end

  create_table "glb_pc_modelo", :primary_key => "sqc_modelo", :force => true do |t|
    t.string "nme_modelo",       :limit => 50, :null => false
    t.string "cdg_tipo_grafico", :limit => 10
  end

  create_table "glb_pc_painel_controle", :primary_key => "sqc_painel_controle", :force => true do |t|
    t.string    "nme_painel_controle", :limit => 40,  :null => false
    t.string    "dsc_painel_controle", :limit => 500, :null => false
    t.string    "cdg_sistema",         :limit => 3,   :null => false
    t.boolean   "cdg_contexto",                       :null => false
    t.string    "tpo_visualizacao",    :limit => 1,   :null => false
    t.integer   "cdg_permissao",                      :null => false
    t.integer   "nmr_coluna",                         :null => false
    t.integer   "cdg_usuario_cad",                    :null => false
    t.timestamp "dta_cadastro",                       :null => false
    t.integer   "cdg_usuario_alt"
    t.timestamp "dta_alteracao"
    t.integer   "cdg_diretorio"
  end

  create_table "glb_pc_painel_item", :primary_key => "sqc_item", :force => true do |t|
    t.integer   "sqc_painel_controle",                :null => false
    t.string    "nme_titulo",          :limit => 100
    t.string    "nme_subtitulo",       :limit => 100
    t.integer   "sqc_analise",                        :null => false
    t.integer   "sqc_modelo",                         :null => false
    t.integer   "nmr_coluna",                         :null => false
    t.integer   "nmr_linha",                          :null => false
    t.integer   "sqc_paleta",                         :null => false
    t.string    "sta_mostrar_valor",   :limit => 1
    t.string    "tpo_rotulo",          :limit => 1
    t.string    "sta_3d",              :limit => 1
    t.string    "sta_animado",         :limit => 1
    t.integer   "cdg_usuario_cad",                    :null => false
    t.timestamp "dta_cadastro",                       :null => false
    t.integer   "cdg_usuario_alt"
    t.timestamp "dta_alteracao"
  end

  create_table "glb_pc_painel_item_coluna", :primary_key => "sqc_item", :force => true do |t|
    t.integer "sqc_coluna_analise",              :null => false
    t.string  "tpo_coluna_base",    :limit => 1, :null => false
  end

  create_table "glb_pc_painel_item_filtro", :primary_key => "sqc_item", :force => true do |t|
    t.integer "sqc_coluna_analise",                :null => false
    t.string  "cdg_operador",       :limit => 20,  :null => false
    t.boolean "sqc_sequencia",                     :null => false
    t.string  "dsc_valor_inicial",  :limit => 240, :null => false
    t.string  "dsc_valor_final",    :limit => 240
  end

  create_table "glb_pensamento", :primary_key => "dta_pensamento", :force => true do |t|
    t.string "dsc_pensamento", :limit => 150, :null => false
    t.string "nme_autor",      :limit => 20,  :null => false
  end

  create_table "glb_pessoa", :primary_key => "cdg_pessoa", :force => true do |t|
    t.timestamp "dta_cadastro",                          :null => false
    t.string    "nme_usuario_cad",        :limit => 20,  :null => false
    t.string    "nme_pessoa",             :limit => 80,  :null => false
    t.string    "nme_pessoa_fonetica",    :limit => 80,  :null => false
    t.string    "tpo_pessoa",             :limit => 1,   :null => false
    t.string    "sta_situacao",           :limit => 1,   :null => false
    t.boolean   "cdg_tratamento",                        :null => false
    t.timestamp "dta_alteracao"
    t.string    "nme_usuario_alt",        :limit => 20
    t.date      "dta_nascimento"
    t.string    "dsc_email",              :limit => 50
    t.string    "dsc_url",                :limit => 80
    t.string    "tpo_sexo",               :limit => 1
    t.string    "tpo_estado_civil",       :limit => 1
    t.string    "nme_conjuge",            :limit => 50
    t.date      "dta_nascimento_conjuge"
    t.date      "dta_expedicao_rg"
    t.string    "dsc_expedidor_rg",       :limit => 6
    t.boolean   "cdg_nacionalidade"
    t.integer   "cdg_naturalidade"
    t.string    "dsc_naturalidade_int",   :limit => 60
    t.boolean   "nmr_grau_instrucao"
    t.string    "nme_contato",            :limit => 50
    t.string    "nmr_ie",                 :limit => 14
    t.string    "nmr_im",                 :limit => 11
    t.string    "nme_fantasia",           :limit => 50
    t.boolean   "cdg_religiao"
    t.string    "nmr_documento_pessoal",  :limit => 30
    t.string    "nmr_documento_fiscal",   :limit => 30
    t.integer   "cdg_profissao"
    t.string    "dsc_formacao",           :limit => 100
  end

  add_index "glb_pessoa", ["cdg_nacionalidade"], :name => "fk_pai_pes"
  add_index "glb_pessoa", ["cdg_naturalidade"], :name => "fk_lcd_pes"
  add_index "glb_pessoa", ["cdg_profissao"], :name => "fk_fnc_pes"
  add_index "glb_pessoa", ["cdg_religiao"], :name => "fk_rlg_pes"
  add_index "glb_pessoa", ["cdg_tratamento"], :name => "fk_trt_pes"
  add_index "glb_pessoa", ["nme_pessoa_fonetica"], :name => "ak_pes_01"

  create_table "glb_pessoa_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_pessoa",                           :null => false
    t.timestamp "dta_alteracao",                        :null => false
    t.string    "nme_usuario_alt",        :limit => 20, :null => false
    t.string    "tpo_operacao",           :limit => 1,  :null => false
    t.string    "nme_pessoa",             :limit => 80, :null => false
    t.string    "tpo_pessoa",             :limit => 1,  :null => false
    t.string    "sta_situacao",           :limit => 1,  :null => false
    t.boolean   "cdg_tratamento",                       :null => false
    t.date      "dta_nascimento"
    t.string    "dsc_email",              :limit => 50
    t.string    "dsc_url",                :limit => 80
    t.string    "tpo_sexo",               :limit => 1
    t.string    "tpo_estado_civil",       :limit => 1
    t.string    "nme_conjuge",            :limit => 50
    t.date      "dta_nascimento_conjuge"
    t.string    "nmr_rg",                 :limit => 14
    t.date      "dta_expedicao_rg"
    t.string    "dsc_expedidor_rg",       :limit => 6
    t.boolean   "cdg_nacionalidade"
    t.integer   "cdg_naturalidade"
    t.string    "dsc_naturalidade_int",   :limit => 60
    t.boolean   "nmr_grau_instrucao"
    t.integer   "nmr_cpf_cgc"
    t.string    "nme_contato",            :limit => 50
    t.string    "nmr_ie",                 :limit => 14
    t.string    "nmr_im",                 :limit => 11
    t.string    "nme_fantasia",           :limit => 50
    t.boolean   "cdg_religiao"
    t.boolean   "cdg_idioma"
    t.string    "dsc_tipo_documento_int", :limit => 6
    t.string    "nmr_documento_int",      :limit => 20
  end

  add_index "glb_pessoa_alteracao", ["cdg_pessoa"], :name => "fk_pes_pesalt"
  add_index "glb_pessoa_alteracao", ["dta_alteracao"], :name => "ak_pesalt_01"

  create_table "glb_pessoa_alteracao_avaliacao", :id => false, :force => true do |t|
    t.integer   "cdg_pessoa",                       :null => false
    t.timestamp "dta_alteracao",                    :null => false
    t.string    "nme_usuario_alt",    :limit => 20, :null => false
    t.string    "nme_pessoa_ant",     :limit => 50, :null => false
    t.string    "tpo_pessoa_ant",     :limit => 1,  :null => false
    t.date      "dta_nascimento_ant"
    t.string    "tpo_sexo_ant",       :limit => 1
    t.integer   "nmr_cpf_cgc_ant"
    t.string    "nme_pessoa",         :limit => 50, :null => false
    t.string    "tpo_pessoa",         :limit => 1,  :null => false
    t.date      "dta_nascimento"
    t.string    "tpo_sexo",           :limit => 1
    t.integer   "nmr_cpf_cgc"
  end

  add_index "glb_pessoa_alteracao_avaliacao", ["cdg_pessoa"], :name => "fk_pes_pesala"
  add_index "glb_pessoa_alteracao_avaliacao", ["dta_alteracao"], :name => "ak_pesala_01"

  create_table "glb_pessoa_email_alteracao", :primary_key => "cdg_pessoa", :force => true do |t|
    t.integer   "cdg_profissional",               :null => false
    t.timestamp "dta_alteracao",                  :null => false
    t.string    "tpo_operacao",     :limit => 1,  :null => false
    t.string    "tpo_origem",       :limit => 1,  :null => false
    t.string    "nme_usuario_alt",  :limit => 20, :null => false
    t.string    "dsc_email",        :limit => 50
    t.boolean   "cdg_equipe"
  end

  add_index "glb_pessoa_email_alteracao", ["cdg_profissional", "dta_alteracao", "tpo_operacao"], :name => "ak_eal_01"

  create_table "glb_pessoa_endereco", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "sqc_sequencia",                      :null => false
    t.timestamp "dta_cadastro",                       :null => false
    t.string    "tpo_endereco",         :limit => 1,  :null => false
    t.integer   "cdg_localidade"
    t.integer   "cdg_logradouro"
    t.string    "dsc_logradouro_ncad",  :limit => 60
    t.boolean   "cdg_bairro_ncad"
    t.string    "dsc_bairro_ncad",      :limit => 60
    t.string    "nmr_cep_ncad",         :limit => 10
    t.integer   "nmr_endereco",                       :null => false
    t.string    "dsc_complemento",      :limit => 30
    t.string    "dsc_ponto_referencia", :limit => 40
    t.string    "dsc_estado_ncad",      :limit => 30
    t.boolean   "cdg_pais",                           :null => false
    t.string    "dsc_localidade_ncad",  :limit => 60
    t.string    "sta_principal",        :limit => 1
  end

  add_index "glb_pessoa_endereco", ["cdg_localidade", "cdg_logradouro"], :name => "fk_lgd_pesend"

  create_table "glb_pessoa_endereco_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_pessoa",                         :null => false
    t.boolean   "sqc_sequencia",                      :null => false
    t.timestamp "dta_alteracao",                      :null => false
    t.string    "nme_usuario_alt",      :limit => 20, :null => false
    t.string    "tpo_operacao",         :limit => 1,  :null => false
    t.string    "tpo_endereco",         :limit => 1,  :null => false
    t.integer   "cdg_localidade",                     :null => false
    t.integer   "cdg_logradouro"
    t.string    "dsc_logradouro_ncad",  :limit => 60
    t.boolean   "cdg_bairro_ncad"
    t.string    "dsc_bairro_ncad",      :limit => 60
    t.string    "nmr_cep_ncad",         :limit => 10
    t.integer   "nmr_endereco",                       :null => false
    t.string    "dsc_complemento",      :limit => 30
    t.string    "dsc_ponto_referencia", :limit => 40
  end

  add_index "glb_pessoa_endereco_alteracao", ["cdg_pessoa", "sqc_sequencia"], :name => "fk_pes_peseda"

  create_table "glb_pessoa_fisica_funcao", :primary_key => "cdg_pessoa_juridica", :force => true do |t|
    t.integer   "cdg_pessoa",                               :null => false
    t.string    "dsc_funcao",                :limit => 120, :null => false
    t.string    "dsc_departamento",          :limit => 80
    t.string    "dsc_observacao",            :limit => 200
    t.string    "sta_organizacao_principal", :limit => 1,   :null => false
    t.string    "nme_usuario_alt",           :limit => 20,  :null => false
    t.timestamp "dta_alteracao",                            :null => false
  end

  add_index "glb_pessoa_fisica_funcao", ["cdg_pessoa"], :name => "fk_pes_pesfnc_1"
  add_index "glb_pessoa_fisica_funcao", ["cdg_pessoa_juridica"], :name => "fk_pes_pesfnc_2"

  create_table "glb_pessoa_fisica_idioma", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "cdg_idioma",                      :null => false
    t.string    "tpo_nivel_fluencia", :limit => 1
    t.string    "sta_principal",      :limit => 1, :null => false
    t.integer   "cdg_usuario_cad",                 :null => false
    t.timestamp "dta_cadastro",                    :null => false
  end

  create_table "glb_pessoa_grupo", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "cdg_grupo",                     :null => false
    t.timestamp "dta_cadastro",                  :null => false
    t.string    "nme_usuario_cad", :limit => 20, :null => false
  end

  add_index "glb_pessoa_grupo", ["cdg_grupo"], :name => "fk_grp_pesgrp"

  create_table "glb_pessoa_imagem", :primary_key => "cdg_pessoa", :force => true do |t|
    t.binary "img_pessoa",       :limit => 1048576, :null => false
    t.string "dsc_content_type", :limit => 20
    t.string "nme_arquivo",      :limit => 100
  end

  create_table "glb_pessoa_juridica_espec", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "cdg_especialidade",               :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "nme_usuario_alt",   :limit => 20, :null => false
  end

  add_index "glb_pessoa_juridica_espec", ["cdg_especialidade"], :name => "fk_esp_pesesp"

  create_table "glb_pessoa_juridica_espec_alt", :id => false, :force => true do |t|
    t.integer   "cdg_pessoa",                      :null => false
    t.boolean   "cdg_especialidade",               :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "nme_usuario_alt",   :limit => 20, :null => false
    t.string    "tpo_operacao",      :limit => 1,  :null => false
  end

  add_index "glb_pessoa_juridica_espec_alt", ["cdg_pessoa", "cdg_especialidade"], :name => "fk_pesesp_pesesa"

  create_table "glb_pessoa_nivel_relac", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "cdg_nivel_relacionamento",               :null => false
    t.timestamp "dta_cadastro",                           :null => false
    t.string    "nme_usuario_cad",          :limit => 20, :null => false
  end

  add_index "glb_pessoa_nivel_relac", ["cdg_nivel_relacionamento"], :name => "fk_nvr_pesnvr"

  create_table "glb_pessoa_telefone", :primary_key => "cdg_pessoa", :force => true do |t|
    t.boolean   "sqc_sequencia",                 :null => false
    t.timestamp "dta_cadastro",                  :null => false
    t.string    "tpo_telefone",    :limit => 1,  :null => false
    t.string    "tpo_linha",       :limit => 1,  :null => false
    t.boolean   "nmr_ddd",                       :null => false
    t.integer   "nmr_telefone",                  :null => false
    t.integer   "nmr_ramal"
    t.integer   "cdg_localidade"
    t.string    "sta_bloqueio",    :limit => 1
    t.timestamp "dta_bloqueio"
    t.string    "nme_usuario_blq", :limit => 20
    t.string    "sta_principal",   :limit => 1
    t.boolean   "cdg_pais",                      :null => false
  end

  add_index "glb_pessoa_telefone", ["cdg_localidade", "nmr_ddd"], :name => "fk_lcd_pestlf"
  add_index "glb_pessoa_telefone", ["nmr_ddd", "nmr_telefone", "nmr_ramal", "cdg_pessoa"], :name => "ak_pestlf_01"

  create_table "glb_pessoa_telefone_alteracao", :id => false, :force => true do |t|
    t.integer   "cdg_pessoa",                    :null => false
    t.boolean   "sqc_sequencia",                 :null => false
    t.timestamp "dta_alteracao",                 :null => false
    t.string    "nme_usuario_alt", :limit => 20, :null => false
    t.string    "tpo_operacao",    :limit => 1,  :null => false
    t.boolean   "nmr_ddd",                       :null => false
    t.integer   "nmr_telefone",                  :null => false
    t.integer   "nmr_ramal"
    t.string    "tpo_telefone",    :limit => 1,  :null => false
    t.string    "tpo_linha",       :limit => 1
    t.integer   "cdg_localidade"
    t.string    "sta_bloqueio",    :limit => 1
    t.timestamp "dta_bloqueio"
    t.string    "nme_usuario_blq", :limit => 20
  end

  add_index "glb_pessoa_telefone_alteracao", ["cdg_pessoa", "sqc_sequencia"], :name => "fk_pes_pestla"

  create_table "glb_pessoa_unificacao", :primary_key => "cdg_pessoa", :force => true do |t|
    t.integer   "cdg_pessoa_unificada",               :null => false
    t.string    "nme_usuario_unif",     :limit => 20, :null => false
    t.timestamp "dta_unificacao",                     :null => false
  end

  create_table "glb_processo", :primary_key => "sqc_processo", :force => true do |t|
    t.string    "cdg_sistema",       :limit => 3,   :null => false
    t.string    "cdg_tipo_processo", :limit => 3,   :null => false
    t.string    "dsc_processo",      :limit => 50,  :null => false
    t.string    "nme_usuario_prc",   :limit => 20,  :null => false
    t.timestamp "dta_inicial",                      :null => false
    t.timestamp "dta_final"
    t.string    "sta_resultado",     :limit => 1
    t.string    "dsc_erro",          :limit => 250
    t.integer   "sqc_processo_sup"
    t.string    "dsc_parametros",    :limit => 150
  end

  add_index "glb_processo", ["cdg_sistema", "cdg_tipo_processo", "dta_inicial"], :name => "fk_tpoprc_prc"
  add_index "glb_processo", ["dta_inicial"], :name => "ak_prc_01"
  add_index "glb_processo", ["sqc_processo_sup"], :name => "fk_prc_prc"

  create_table "glb_profissao", :primary_key => "cdg_profissao", :force => true do |t|
    t.string    "dsc_profissao_masculino", :limit => 80, :null => false
    t.string    "dsc_profissao_feminino",  :limit => 80, :null => false
    t.integer   "cdg_usuario_alt",                       :null => false
    t.timestamp "dta_alteracao",                         :null => false
  end

  create_table "glb_profissional", :primary_key => "cdg_profissional", :force => true do |t|
    t.integer   "cdg_pessoa",                    :null => false
    t.integer   "cdg_usuario"
    t.integer   "nmr_matricula"
    t.string    "nme_usuario_alt", :limit => 20
    t.timestamp "dta_alteracao"
  end

  add_index "glb_profissional", ["cdg_pessoa"], :name => "fk_pes_prf"
  add_index "glb_profissional", ["cdg_usuario"], :name => "fk_usr_prf"
  add_index "glb_profissional", ["nmr_matricula"], :name => "ak_prf_01"

  create_table "glb_ramo_atividade", :primary_key => "cdg_ramo_atividade", :force => true do |t|
    t.string "dsc_ramo_atividade", :limit => 40, :null => false
  end

  create_table "glb_relatorio", :primary_key => "cdg_relatorio", :force => true do |t|
    t.string    "nme_relatorio",           :limit => 200, :null => false
    t.integer   "sqc_analise",                            :null => false
    t.string    "tpo_relatorio",           :limit => 1,   :null => false
    t.string    "tpo_visualizacao",        :limit => 1,   :null => false
    t.integer   "cdg_usuario_cad",                        :null => false
    t.timestamp "dta_cadastro",                           :null => false
    t.string    "cdg_sistema",             :limit => 3
    t.string    "sta_bloqueado",           :limit => 1
    t.xml       "dsc_xml_config_consulta"
    t.xml       "dsc_xml_config_grafico"
    t.boolean   "cdg_diretorio"
    t.integer   "cdg_usuario_alt",                        :null => false
  end

  add_index "glb_relatorio", ["cdg_diretorio"], :name => "ak_rel_01"

  create_table "glb_relatorio_agrupamento", :primary_key => "cdg_relatorio", :force => true do |t|
    t.integer "sqc_coluna_analise",              :null => false
    t.string  "tpo_ordenacao",      :limit => 1, :null => false
    t.integer "nmr_ordem_quebra",                :null => false
    t.string  "tpo_agrupamento",    :limit => 1
    t.integer "cdg_usuario_alt",                 :null => false
  end

  create_table "glb_relatorio_agrupamento_alt", :id => false, :force => true do |t|
    t.integer   "cdg_relatorio",                   :null => false
    t.integer   "sqc_coluna_analise",              :null => false
    t.string    "tpo_ordenacao",      :limit => 1, :null => false
    t.integer   "nmr_ordem_quebra",                :null => false
    t.string    "tpo_agrupamento",    :limit => 1
    t.integer   "cdg_usuario_alt",                 :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "tpo_operacao",       :limit => 1, :null => false
  end

  create_table "glb_relatorio_alt", :id => false, :force => true do |t|
    t.integer   "cdg_relatorio",                          :null => false
    t.string    "nme_relatorio",           :limit => 200, :null => false
    t.integer   "sqc_analise",                            :null => false
    t.string    "tpo_relatorio",           :limit => 1,   :null => false
    t.string    "tpo_visualizacao",        :limit => 1,   :null => false
    t.string    "cdg_sistema",             :limit => 3
    t.string    "sta_bloqueado",           :limit => 1
    t.xml       "dsc_xml_config_consulta"
    t.xml       "dsc_xml_config_grafico"
    t.boolean   "cdg_diretorio"
    t.integer   "cdg_usuario_alt",                        :null => false
    t.timestamp "dta_alteracao",                          :null => false
    t.string    "tpo_operacao",            :limit => 1,   :null => false
  end

  create_table "glb_relatorio_coluna", :primary_key => "sqc_coluna_analise", :force => true do |t|
    t.integer "cdg_relatorio",                :null => false
    t.integer "nmr_ordem",                    :null => false
    t.string  "sta_soma",        :limit => 1, :null => false
    t.string  "sta_media",       :limit => 1, :null => false
    t.string  "sta_menor_valor", :limit => 1, :null => false
    t.string  "sta_maior_valor", :limit => 1, :null => false
    t.string  "sta_moda",        :limit => 1, :null => false
    t.integer "cdg_usuario_alt",              :null => false
  end

  create_table "glb_relatorio_coluna_alt", :id => false, :force => true do |t|
    t.integer   "cdg_relatorio",                   :null => false
    t.integer   "sqc_coluna_analise",              :null => false
    t.integer   "nmr_ordem",                       :null => false
    t.string    "sta_soma",           :limit => 1, :null => false
    t.string    "sta_media",          :limit => 1, :null => false
    t.string    "sta_menor_valor",    :limit => 1, :null => false
    t.string    "sta_maior_valor",    :limit => 1, :null => false
    t.string    "sta_moda",           :limit => 1, :null => false
    t.integer   "cdg_usuario_alt",                 :null => false
    t.timestamp "dta_alteracao",                   :null => false
    t.string    "tpo_operacao",       :limit => 1, :null => false
  end

  create_table "glb_relatorio_criterio", :primary_key => "sqc_coluna_analise", :force => true do |t|
    t.integer "cdg_relatorio",                    :null => false
    t.integer "sqc_sequencia",                    :null => false
    t.string  "cdg_operador",      :limit => 20,  :null => false
    t.string  "dsc_valor_inicial", :limit => 240, :null => false
    t.string  "dsc_valor_final",   :limit => 240
    t.integer "cdg_usuario_alt",                  :null => false
  end

  create_table "glb_relatorio_criterio_alt", :id => false, :force => true do |t|
    t.integer   "cdg_relatorio",                     :null => false
    t.integer   "sqc_coluna_analise",                :null => false
    t.integer   "sqc_sequencia",                     :null => false
    t.string    "cdg_operador",       :limit => 20,  :null => false
    t.string    "dsc_valor_inicial",  :limit => 240, :null => false
    t.string    "dsc_valor_final",    :limit => 240
    t.integer   "cdg_usuario_alt",                   :null => false
    t.timestamp "dta_alteracao",                     :null => false
    t.string    "tpo_operacao",       :limit => 1,   :null => false
  end

  create_table "glb_relatorio_favorito", :primary_key => "cdg_relatorio", :force => true do |t|
    t.integer "cdg_usuario", :null => false
  end

  create_table "glb_religiao", :primary_key => "cdg_religiao", :force => true do |t|
    t.string "nme_religiao", :limit => 30, :null => false
  end

  create_table "glb_tipo_agrupamento", :primary_key => "cdg_tipo_agrupamento", :force => true do |t|
    t.string  "dsc_tipo_agrupamento",  :limit => 30, :null => false
    t.string  "dsc_sigla",             :limit => 20, :null => false
    t.boolean "cdg_grupo_agrupamento",               :null => false
  end

  add_index "glb_tipo_agrupamento", ["cdg_grupo_agrupamento"], :name => "fk_grpagp_tpoagp"

  create_table "glb_tipo_logradouro", :primary_key => "cdg_tipo_logradouro", :force => true do |t|
    t.boolean "cdg_idioma",                            :null => false
    t.string  "dsc_tipo_logradouro",     :limit => 20, :null => false
    t.string  "dsc_sigla",               :limit => 10
    t.boolean "cdg_tipo_logradouro_dne"
  end

  create_table "glb_tipo_orgao", :primary_key => "cdg_tipo_orgao", :force => true do |t|
    t.string "dsc_tipo_orgao", :limit => 50, :null => false
  end

  create_table "glb_tipo_processo", :primary_key => "cdg_sistema", :force => true do |t|
    t.string "cdg_tipo_processo", :limit => 3,  :null => false
    t.string "dsc_processo",      :limit => 30, :null => false
  end

  create_table "glb_titulo_logradouro", :primary_key => "cdg_titulo_logradouro", :force => true do |t|
    t.boolean "cdg_idioma",                              :null => false
    t.string  "dsc_titulo_logradouro",     :limit => 25, :null => false
    t.string  "dsc_sigla",                 :limit => 10
    t.boolean "cdg_titulo_logradouro_dne"
  end

  create_table "glb_tratamento", :primary_key => "cdg_tratamento", :force => true do |t|
    t.string "dsc_tratamento_mas", :limit => 35, :null => false
    t.string "dsc_sigla_mas",      :limit => 15, :null => false
    t.string "dsc_tratamento_fem", :limit => 35, :null => false
    t.string "dsc_sigla_fem",      :limit => 15, :null => false
  end

  create_table "glb_unidade_medida", :primary_key => "cdg_unidade", :force => true do |t|
    t.string    "dsc_unidade",     :limit => 15, :null => false
    t.string    "sgl_unidade",     :limit => 5,  :null => false
    t.string    "sta_decimal",     :limit => 1,  :null => false
    t.timestamp "dta_alteracao",                 :null => false
    t.string    "nme_usuario_alt", :limit => 20, :null => false
  end

  create_table "glb_usuario_ultimos_acessos", :primary_key => "cdg_usuario", :force => true do |t|
    t.string "txt_log", :limit => 16285, :null => false
  end

  create_table "glb_visualizacao", :primary_key => "cdg_visualizacao", :force => true do |t|
    t.boolean   "cdg_perfil"
    t.boolean   "cdg_contexto",                      :null => false
    t.string    "nme_visualizacao",  :limit => 50,   :null => false
    t.timestamp "dta_cadastro"
    t.string    "sta_publicado",     :limit => 1,    :null => false
    t.string    "sta_definido",      :limit => 1,    :null => false
    t.integer   "cdg_usuario"
    t.integer   "cdg_usuario_cad"
    t.string    "dsc_subformulario", :limit => 7500
    t.string    "dsc_visualizacao",  :limit => 7500
  end

  create_table "universes", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.text      "sql",         :limit => 1048576
    t.timestamp "created_at",                     :null => false
    t.timestamp "updated_at",                     :null => false
  end

end
