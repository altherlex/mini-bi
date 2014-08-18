require "rails_helper"

describe Column do
  before(:each) do
    @universe = Universe.new
    @universe.name = 'Test association'
    @universe.sql = 'select [name; descripton] from universes'
    @universe.save!
 
    @column = Column.new
    @column.universe_id = @universe.id
  end
  context "validations" do
    it "should be unique of universe" do
      expect(@column).to_not be_valid
      @column.nme_termo = 'name'
      expect(@column).to_not be_valid
      @column.dsc_termo = 'name'
      expect(@column).to_not be_valid
      expect(@column.errors.messages.size).to eq(1)
      expect(@column.errors.messages[:nme_termo]).to_not be_nil
    end
    it "sucess" do
      @column.update_attributes(nme_termo:'teste', dsc_termo:'Teste')
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
end

