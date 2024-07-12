

class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fess

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fess = 0
  end

  def add_service(service)
    @services << service
  end



  def register_vehicle(vehicle)
    raise TypeError, "Vehicle must be a vehicle object" unless name.is_a?(Vehicle)

    if vehicle.engine == :ev
      puts "ev"
      @collected_fess += 200
    elsif year - vehicle.age >= 25
      puts "antique"
      @collected_fess += 25
    else
      puts "general"
      @collected_fess += 100
    end

    @register_vehicle << vehicle
  end

end
