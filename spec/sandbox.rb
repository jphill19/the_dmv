require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/registrant'
require 'date'
require './lib/vehicle_factory'
require './lib/facility_builder'


facility_builder = FacilityBuilder.new
co_dmv_offices = DmvDataService.new.co_dmv_office_locations
ny_dmv_offices = DmvDataService.new.ny_dmv_office_locations
mo_dmv_offices =  DmvDataService.new.mo_dmv_office_locations

puts "\n#{co_dmv_offices[0]}"


puts "\n#{ny_dmv_offices[1]}"

puts "\n\n#{mo_dmv_offices[1]}"


# facility = Facility.new({"jose" => 1})
# p facility