require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
 
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end


  describe '#register_vehicle' do

    it "will only function if facility has the service to do so" do
      expect(@facility_1.register_vehicle(@cruz)).to eq([])

      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])

    end

    it 'will raise an error if the vehicle passed is not a vehicle object' do
      @facility_1.add_service('Vehicle Registration')
      expect {@facility_1.register_vehicle("cruz")}.to raise_error(TypeError, "Vehicle must be a vehicle object")
    end

    it 'can appropriately register ev vehicles' do

      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@bolt.plate_type).to eq(:placeholder)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
      expect(@facility_1.registered_vehicles).to eq([@bolt])
      expect(@bolt.registration_date).to be_an_instance_of(Date)
      expect(@bolt.plate_type).to eq(:ev)

    end

    it 'can appropriately register antique vehicles' do

      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@camaro.plate_type).to eq(:placeholder)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
      expect(@facility_1.registered_vehicles).to eq([@camaro])
      expect(@camaro.registration_date).to be_an_instance_of(Date)
      expect(@camaro.plate_type).to eq(:antique)


    end

    it 'can appropriately register regular vehicle' do

      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@cruz.plate_type).to eq(:placeholder)

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to be_an_instance_of(Date)
      expect(@cruz.plate_type).to eq(:regular)


    end

    it "keeps track of all the collected_fees properly" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
    end

    it "keeps track of all the registered_vehicles properly" do

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end
  end

  describe '#administer_written_test' do
    it 'can administer_written_test if facility has the service' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)

      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)

    end

    it 'will raise an error if the registrant passed is not a registrant object' do

      @facility_1.add_service('Written Test')
      expect {@facility_1.administer_written_test("registrant_1")}.to raise_error(TypeError, "registrant must be a registrant object")

    end

    it 'will only be performed on registrants who qualify (age >= 16 && registrant.permit?)' do
      @facility_1.add_service('Written Test')
      
      # registrant_3 does not qualify (no permit & too young)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    

      #registrant_2 does not qualify (no permit)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      #registrant_1 qualifies!
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

  end

  describe "#administer_road_test" do
    it 'can administer_road_test if facility has the service' do
      @registrant_1.license_data[:written] = true
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)

    end

    it 'will raise an error if the registrant passed is not a registrant object' do
      @registrant_1.license_data[:written] = true
      @facility_1.add_service('Road Test')
      expect {@facility_1.administer_road_test("registrant_1")}.to raise_error(TypeError, "registrant must be a registrant object")

    end

    it "will only be performed on registrants who qualify (registrant.license_data[:written] == true)" do

      # User without having license_data[:written] == true
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      # Same user now having license_data[:written] == true
      @registrant_1.license_data[:written] = true
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)

      # Registrant now has license
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

    end
  end

  describe "#renew_drivers_license" do
    it 'can administer_road_test if facility has the service' do
      @registrant_1.license_data[:license] = true
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)

      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)

    end

    it 'will raise an error if the registrant passed is not a registrant object' do
      @registrant_1.license_data[:license] = true
      @facility_1.add_service('Renew License')
      expect {@facility_1.renew_drivers_license("registrant_1")}.to raise_error(TypeError, "registrant must be a registrant object")

    end

    it "will only be performed on registrants who qualify (registrant.license_data[:license] == true)" do

      # User without having license_data[:license] == true
      @facility_1.add_service('Renew License')
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)

      # Same user now having license_data[:license] == true
      @registrant_1.license_data[:written] = true
      @registrant_1.license_data[:license] = true
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)

      # Registrant now has renewed_license
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})

    end
    
    # No edge case test for renewed_license as the assumption is that a user with a renewed_license can renew again

  end



end
