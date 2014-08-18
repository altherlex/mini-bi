require "rails_helper"

RSpec.describe PanelsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/panels").to route_to("panels#index")
    end

    it "routes to #new" do
      expect(:get => "/panels/new").to route_to("panels#new")
    end

    it "routes to #show" do
      expect(:get => "/panels/1").to route_to("panels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/panels/1/edit").to route_to("panels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/panels").to route_to("panels#create")
    end

    it "routes to #update" do
      expect(:put => "/panels/1").to route_to("panels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/panels/1").to route_to("panels#destroy", :id => "1")
    end

  end
end
