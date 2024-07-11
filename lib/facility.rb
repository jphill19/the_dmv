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
end
