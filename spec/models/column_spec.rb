require "rails_helper"

describe Column do
  before(:each) do
    @universe = Universe.new
    @universe.name = 'Test association'
    @universe.sql = 'select name, descripton from universes'
    @universe.save!
 
    @column = Column.new
    @column.universe_id = @universe.id
  end
  context "validations" do
    it "should be unique of universe"  do
      expect(Column.new).to be_an_instance_of(Column)
      expect(@column).to_not be_valid
      @column.name = 'name'
      expect(@column).to_not be_valid
      @column.label = 'name'
      expect(@column).to_not be_valid
      expect(@column.errors.messages.size).to eq(1)
      expect(@column.errors.messages[:name]).to_not be_nil
    end
    it "sucess" do
      @column.update_attributes(name:'teste', label:'Teste')
      expect(@column.save!).to eq(true)
    end
  end
  context "association" do
    it "should not have duplicate columns" do
      expect(@universe.columns.size).to eq(2)
    end
    it "not to duplicate columns when edit universe" do
      @universe.save!
      expect(@universe.columns.size).to eq(2)
    end 
  end
  context "class methods" do
    it "method new_cols(Array): return Array of Column", focus:true do
      r = Column.new_cols(['id as pk', 'name', 'count(*) qtd', 'sum(name) qtd_name'])
      expect(r).to be_an Array
      expect(r.size).to eq 4
      expect(r.first).to be_an_instance_of(Column)
    end
    it "method new cols(Array): define Metric|Dimension" do
      r = Column.new_cols(['id as pk', 'name', 'count(*) qtd', 'sum(name) qtd_name'])
      expect(r.select(&:metric?).size).to eq 2
      expect(r.select(&:aggregate?).map(&:name)).to eq ["QTD", "QTD_NAME"]
      expect(r.select(&:dimension?).size).to eq 2
      expect(r.select(&:dimension?).map(&:name)).to eq ["PK", "NAME"]
    end 
  end
end

