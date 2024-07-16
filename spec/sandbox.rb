require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/registrant'
require 'date'
require './lib/vehicle_factory'
require './lib/facility_builder'


factory = VehicleFactory.new
new_data = DmvDataService.new.ny_registrations

# puts "\n#{co_dmv_offices[0]}"


# puts "\n#{ny_dmv_offices[0]}"

puts "\n\n#{new_data[1]}}"


# facility = Facility.new({"jose" => 1})
# p facility

