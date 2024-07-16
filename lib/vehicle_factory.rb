class VehicleFactory
  attr_reader :vehicles_created, :ny_vehicles_created
  def initialize
    @vehicles_created = []
  end

  def create_wa_vehicles(data)

    data.each do |vehicle|
      vehicle.default = "not available"
      new_vehicle = Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year].to_i,
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })

      @vehicles_created << new_vehicle
    end
    return @vehicles_created
  end


  
  def create_ny_vehicles(data) # iteration 4, P.S these are boats, and not vehicles
    @ny_vehicles_created = data.map do |vehicle|
      vehicle.default = "not available"
      new_vehicle = Vehicle.new(
        vin: vehicle[:vin],
        year: vehicle[:model_year].to_i,
        make: vehicle[:make],
        model: vehicle[:body_type], 
        engine: vehicle[:fuel_type].downcase.to_sym 
      )
    end
  end

end