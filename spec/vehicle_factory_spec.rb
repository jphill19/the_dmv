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

    it "creates vehicle objects with the expected values" do
      #picking a random index number to demonstrate
      expect(@factory.create_vehicles(@wa_ev_registrations)[3].vin).to eq("3C3CFFGE5F")
      expect(@factory.create_vehicles(@wa_ev_registrations)[3].year).to eq(2015)
      expect(@factory.create_vehicles(@wa_ev_registrations)[3].make).to eq("FIAT")
      expect(@factory.create_vehicles(@wa_ev_registrations)[3].model).to eq("500")
      expect(@factory.create_vehicles(@wa_ev_registrations)[3].engine).to eq(:ev)
    end


    it "every attribute for each vehicle has a value (a truthy value) " do
      @factory.create_vehicles(@wa_ev_registrations)

      @factory.vehicles_created.each do |vehicle|
        expect(vehicle.vin).to be_truthy
        expect(vehicle.year).to be_truthy
        expect(vehicle.make).to be_truthy
        expect(vehicle.model).to be_truthy
        expect(vehicle.engine).to be_truthy
        
      end

    end

    
  end
  

end