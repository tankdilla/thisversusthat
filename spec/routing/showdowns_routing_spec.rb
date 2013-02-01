require "spec_helper"

describe ShowdownsController do
  describe "routing" do

    it "routes to #index" do
      get("/showdowns").should route_to("showdowns#index")
    end

    it "routes to #new" do
      get("/showdowns/new").should route_to("showdowns#new")
    end

    it "routes to #show" do
      get("/showdowns/1").should route_to("showdowns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/showdowns/1/edit").should route_to("showdowns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/showdowns").should route_to("showdowns#create")
    end

    it "routes to #update" do
      put("/showdowns/1").should route_to("showdowns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/showdowns/1").should route_to("showdowns#destroy", :id => "1")
    end

  end
end
