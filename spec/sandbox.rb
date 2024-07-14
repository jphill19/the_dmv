require "./lib/dmv_data_service"


# wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# wa_ev_registrations.each do |vehicle|

#   puts vehicle[:vin_1_10]

# end


new_data = DmvDataService.new.co_dmv_office_locations


# puts new_data[0]

puts new_data[0][:dmv_office]

puts new_data[0][:address_li] + ' ' +  new_data[0][:address__1] + ' ' +  new_data[0][:city] + ' ' +  new_data[0][:state] + ' ' + new_data[0][:zip] 

puts new_data[0][:phone]

