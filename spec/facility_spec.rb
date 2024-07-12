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
      expect(@facility_1.register_vehicle(@cruz)).to eq("This Facility does not have this service")

      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.register_vehicle(@cruz)).to eq("Cruz has been registered")

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


    

  end



end
