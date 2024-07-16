require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/vehicle.rb'

###### Option 3 ---> Analytics #######

wa_ev_registrations = DmvDataService.new.wa_ev_registrations
factory = VehicleFactory.new
factory.create_vehicles(wa_ev_registrations)


# Hash for 
vehicle_make_count = Hash.new(0)
vehicle_model_count = Hash.new(0)
vehicle_years_count = Hash.new(0)



def max_count (data)
  max_key = "placeholder"
  max_count = 0

  data.each do |key, value|
    if value > max_count
      max_key = key
      max_count = value
    end
  end
  return [max_key, max_count]
end


#Generatiing new Hashes & Array to perform analytics (sanitizing data)
factory.vehicles_created.each do |test|
  vehicle_model_count[test.model] += 1
  vehicle_make_count[test.make] += 1
  vehicle_years_count[test.year] += 1

end

max_model = max_count(vehicle_model_count)
max_make = max_count(vehicle_make_count)
vehicle_years_sorted = vehicle_years_count.sort_by { |key| key}


puts "The most popular model regisred is: #{max_model[0]}, with a total of #{max_model[1]}/#{factory.vehicles_created.length}\n"
puts "The most popular make registered is #{max_make[0]}, with a total of #{max_make[1]}/#{factory.vehicles_created.length}\n"

puts "\nVehicle By Years"
vehicle_years_sorted.each do |key, value|
  puts "Year: #{key}, Total: #{value}"
end

puts 