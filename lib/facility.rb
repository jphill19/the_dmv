

class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end



  def register_vehicle(vehicle)

    if @services.include?('Vehicle Registration')
      raise TypeError, "Vehicle must be a vehicle object" unless vehicle.is_a?(Vehicle)
      
      if vehicle.electric_vehicle?
        vehicle.set_platetype(:ev)
        @collected_fees += 200

      elsif vehicle.antique?
        vehicle.set_platetype(:antique)
        @collected_fees += 25

      else
        vehicle.set_platetype(:regular)
        @collected_fees += 100

      end

      vehicle.set_registration_date

      @registered_vehicles << vehicle

      # return "#{vehicle.model} has been registered"

    else
      @registered_vehicles
    end

  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      
      if registrant.age >= 16 && registrant.permit?
        registrant.license_data[:written] = true
      else
        return false
      end

        ## change the return value of register vehicle to be an array

    else
      return false
    end
  end

end


