require "rails_helper"

describe Universe do
  before(:each) do
    @universe = Universe.new
    @universe.name = 'My own universe'
  end
  context "validations" do
    it "should have only select (no inject)" do
      expect(@universe).to_not be_valid
      @universe.sql = 'drop table universe;'
      expect(@universe).to_not be_valid
    end
    it "should have columns into select clausule" do
      @universe.sql = 'select * from universes'
      expect(@universe).to_not be_valid
    end
    it "should have select clausule columns between [*]" do
      @universe.sql = 'select id, name from universes'
      expect(@universe.save!).to eq true
      expect(@universe.clausule_select_normalized?).to eq true
    end
    it "should have select clausule columns between [*] if put" do
      @universe.sql = 'select [id; name] from universes'
      @universe.save!
      expect(@universe.clausule_select_normalized?).to eq true
    end
    it "should have select pattern" do
      @universe.sql = 's'
      expect(@universe).to_not be_valid
    end
  end
  context "association" do
    it "should have columns" do
      @universe.sql = 'select id, name from universes'
      @universe.save!
      expect(@universe).to be_valid
      expect(@universe.columns.size).to eq(@universe.columns.size)
    end 
  end
end

