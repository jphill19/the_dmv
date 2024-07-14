require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@factory.vehicles_created).to eq([])
    end
  end

  describe "#create_vehicles" do
    it "creates vehicle objects nested in an array" do
      expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end

    it "stores each vehicle created in vehicles_created " do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to eq(@factory.vehicles_created)
    end

    it "creates a vehicle object for each vehicle coming from the api" do
      expect(@factory.create_vehicles(@wa_ev_registrations).length).to eq(@wa_ev_registrations.length)
    end
    
  end
  

end