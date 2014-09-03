require 'rails_helper'

RSpec.describe Widget, :type => :model do
  before(:each) do
    @universe = Universe.create({
      name:'My own universe',
      sql:'select count(*) as_count, id, name, description from glb.universes'})
    @panel = Panel.create({name:'Panel'})
    @wid = Widget.new({universe_id:@universe.id, panel_id:@panel.id})
    @wid.pattern = 'line'
  end
  context "Config" do
    it "new Widget" do
      expect(@wid.save!).to be true
    end
    it "before save" do
      metric = ['', '1', '2']
      @wid.d_cols = metric
      @wid.m_cols = metric
      expect(@wid.d_cols).to eq(['1', '2'])
      expect(@wid.m_cols).to eq(['1', '2'])
    end
    it "after save" do
      d = [@universe.columns.dim.detect{|i| i.name.include?('NAME')}.id]
      m = [@universe.columns.metric.detect{|i| i.name.include?('AS_COUNT')}.id]
      @wid.d_cols = d
      @wid.m_cols = m
      expect(@wid.save!).to eq true

      wid = Widget.find(@wid.id)
      expect(wid.d_cols).not_to be_nil
      expect(wid.m_cols).not_to be_nil
    end
  end #context config column
  context "Configuring the Panel", focus:true do
    before(:each) do
      @wid.d_cols = [@universe.columns.dim.detect{|i| i.name.include?('NAME')}.id]
      @wid.m_cols = [@universe.columns.metric.detect{|i| i.name.include?('AS_COUNT')}.id]
      @wid.save!
      @wid = Widget.find @wid.id
    end
    it "column config when find" do
      expect(@wid.config).to be_a Array
      expect(@wid.config.size).to eq(2)
      expect(@wid.d_cols.first).to be_a Column
    end
    it "generate a generic query" do
      sql = 'SELECT ID, NAME, DESCRIPTION, COUNT(*) AS_COUNT FROM GLB.UNIVERSES GROUP BY ID, NAME, DESCRIPTION'.upcase.gsub('  ', ' ')
      wid = Widget.new(universe_id:@universe.id)
      expect(wid.load_query.upcase.gsub('  ', ' ')).to eq sql
    end
    it "generate a specific query" do
      expect(@wid.select_cols.size).to eq(2)
      expect(@wid.universe.mount_select(@wid.select_cols)).to eq("NAME, COUNT(*) AS_COUNT")
      sql = 'SELECT NAME, COUNT(*) AS_COUNT FROM GLB.UNIVERSES GROUP BY NAME'.upcase.gsub('  ', ' ')
      expect(@wid.load_query.upcase.gsub('  ', ' ')).to eq sql
    end
    it "execute query" do 
      expect(@wid.load_query).not_to be_nil
      stmt = @wid.execute
      expect(stmt).not_to be_empty
      expect(stmt.size).to be 1
      expect(stmt.first).to be_an_instance_of(Widget)
    end
    it "attributes of query execution" do 
      stmt =  @wid.execute
      attr = [@wid.d_cols.map(&:name).map(&:downcase), @wid.m_cols.map(&:name).map(&:downcase)].flatten
      expect(stmt.first.attribute_names).to eq attr
    end
  end # context Configuration
  context "erro.... when create a widget but not find" do
    before(:each) do
      @universe = Universe.create({
        name:'My own universe',
        sql:'select count(*) as_count, id, name, description from glb.universes'})
      @panel = Panel.create({name:'Panel'})
      @wid = Widget.new({universe_id:@universe.id, panel_id:@panel.id, pattern:'line'})
      @wid.d_cols = [@universe.columns.dim.detect{|i| i.name.include?('NAME')}.id]
      @wid.m_cols = [@universe.columns.metric.detect{|i| i.name.include?('AS_COUNT')}.id]
      @wid.save!
    end
    it "no call after_find" do
      raise @wid.query.inspect
      raise helper.export_csv(Universe.all).inspect
    end
  end #Context
end
