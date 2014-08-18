class Column < ActiveRecord::Base
  attr_accessible :nme_termo, :dsc_termo, :dsc_sql_valores, :sta_coluna_filtro, :sta_obrigado, :tpo_objeto, :txt_apresentacao, :universe_id
  belongs_to :universe
  validates_uniqueness_of :nme_termo, scope: [:universe_id]
  validates :nme_termo, presence: true  
  validates :dsc_termo, presence: true  
  validates :universe_id, presence: true  

  private
  before_save do |record|
    if not record.dsc_termo.present?
      record.dsc_termo = record.nme_termo
    end
  end
end
