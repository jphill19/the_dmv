class VehicleFactory
  attr_reader :vehicles_created
  def initialize
    @vehicles_created = []
  end

  def create_vehicles(data)
    data.each do |vehicle|
      new_vehicle = Vehicle.new({vin: vehicle[:vin_1_10],})
    end

  end

end