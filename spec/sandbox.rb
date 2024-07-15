require "./lib/dmv_data_service"


# wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# puts wa_ev_registrations[3]

# test = "hello"

# if test
#   puts 
# wa_ev_registrations.each do |vehicle|

#   puts vehicle[:vin_1_10]

# end


# new_data = DmvDataService.new.co_dmv_office_locations


# puts new_data[0]

# puts new_data[0][:dmv_office]

# puts new_data[0][:address_li] + ' ' +  new_data[0][:address__1] + ' ' +  new_data[0][:city] + ' ' +  new_data[0][:state] + ' ' + new_data[0][:zip] 

# puts new_data[0][:phone]

# new_data.each do |data|
#   puts data[:services_p].class
#   if data[:services_p].include?('registration')
#     puts true
#   end
# end



# ny_data = DmvDataService.new.ny_dmv_office_locations

# puts ny_data[0]

# puts ny_data[0][:office_name] + ' ' + ny_data[0][:office_type]

# puts "#{ny_data[0][:]}"

# puts ny_data[0][:public_phone_number]

mo = DmvDataService.new.mo_dmv_office_locations
puts mo[0]