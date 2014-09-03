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
RSpec.describe MiniBiHelper, :type => :helper do
  before(:each) do
    @universe = Universe.create({
      name:'My own universe',
      sql:'select count(*) as_count, id, name, description from glb.universes'})
    @panel = Panel.create({name:'Panel'})
    @wid = Widget.new({universe_id:@universe.id, panel_id:@panel.id, pattern:'line'})
    @wid.d_cols = [@universe.columns.dim.detect{|i| i.name.include?('NAME')}.id]
    @wid.m_cols = [@universe.columns.metric.detect{|i| i.name.include?('AS_COUNT')}.id]
    @wid.save!
    #temporary
    @wid = Widget.find @wid.id
  end
  it "Export CSV" do
   raise export_csv(@wid.execute).inspect
  end
end
