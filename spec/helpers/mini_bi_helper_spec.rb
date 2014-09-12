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
  context "export for pdf" do
    it "converting a URL in pdf" do
      file_name = 'panel'
      file = pdf_convert('http://www.google.com', file_name:file_name)
      local = Rails.root.join('tmp', file_name+'.pdf').to_s
      expect( File.exists?(local) ).to eq true
      expect(local).to eq(file.path)
      expect(File.delete(file)).to eq 1
    end
    it "converting a HTML in pdf" do
      file_name = 'panel1'
      file = pdf_convert('<html><head><meta name="pdfkit-page_size" content="Letter"><head><body><h1>TESTE!!!</h1></body></html>', file_name:file_name)
      local = Rails.root.join('tmp', file_name+'.pdf').to_s
      expect( File.exists?(local) ).to eq true
      expect(local).to eq(file.path)
      expect(File.delete(file)).to eq 1
    end
  end
end
