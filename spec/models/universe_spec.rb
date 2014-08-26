require "rails_helper"

describe Universe do
  before(:each) do
    @universe = Universe.new
    @universe.name = 'My own universe'
    @universe.sql = 'select count(*) as_count, id, name, description from universes'
  end
  context "validations" do
    it "drop is not valid" do
      @universe.sql = 'drop table universe;'
      expect(@universe).to_not be_valid
    end
    # todo: fazer describe do select e inserir as coluns; avisar quando houver coluna duplicada
    it "should have columns into select clausule" do
      @universe.sql = 'select * from universes'
      expect(@universe).to_not be_valid
    end
    it "should have select pattern" do
      @universe.sql = 's'
      expect(@universe).to_not be_valid
    end
  end
  context "association" do
    it "should have columns" do
      expect(@universe.save!).to be true
      #expect(@universe.cols.size).to eq(@universe.columns.size)
    end 
    it "colums strip sql string" do
      @universe.sql = "select name, description from glb.universes"
      expect(@universe.cols).to be_a Array
      expect(@universe.cols.size).to eq 2
    end
  end
  context "execute sql" do
    before(:each) do
      @universe = Universe.new
      @universe.name = 'My own universe'
      @universe.sql = 'select count(*) as_count, id, name, description from universes'
      @universe.save!
    end
    it "strip select_line" do
      expect(@universe.head.size).to eq(40)
    end
    it "strip from line" do
      expect(@universe.body.include?('FROM')).to be true
    end
    it "mount select clausule with all columns" do
      expect(@universe.executable?).to eq true 
    end
  end
end
