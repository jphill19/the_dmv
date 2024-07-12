class VehicleFactory
  attr_reader :vehicles_created
  def initialize
    @vehicles_created = []
  end

  def create_vehicles(data)
    data.each do |vehicle|
      new_vehicle = Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })

      @vehicles_created << new_vehicle
      return @vehicles_created
    end

  end



end