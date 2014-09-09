require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WidgetsHelper. For example:
#
# describe WidgetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WidgetsHelper, :type => :helper do
  before(:each) do
    @universe = Universe.create({
      name:'Universe',
      sql:'select count(*) as_count, id, name from glb.universes'})
    @panel = Panel.create({name:'Panel'})
    @wid = Widget.new({universe_id:@universe.id, panel_id:@panel.id, pattern:'line'})
    @wid.d_cols = [@universe.columns.dim.detect{|i| i.name.include?('NAME')}.id]
    @wid.m_cols = [@universe.columns.metric.detect{|i| i.name.include?('AS_COUNT')}.id]
    @wid.save!
    #temporary
    @wid = Widget.find @wid.id
    @config = for_widget(@wid)
  end
  it "Export JSON for highcharts" do
    expect(@config.keys).to eq [:xAxis, :yAxis, :series]
  end
  it "Export Highcharts JSON for charts" do
    expect(@config[:series]).to be_instance_of Array
    expect(@config[:series].first.keys).to eq [:name, :data]
  end
  it "Export Highcharts JSON for pie" do
    expect(@config[:series]).to be_instance_of Array
    @wid.pattern = 'pie'
    @config = for_widget(@wid)
    expect(@config[:series].first.keys).to eq [:type, :name, :data]
    expect(@config[:series].first[:data]).to be_instance_of Array
    raise @config[:series].inspect
    expect(@config[:series].first[:data].first.size).to eq 2
  end
  it "Export CSV" do
    skip('#TODO')
   #raise export_csv(@wid.execute).inspect
  end
end
