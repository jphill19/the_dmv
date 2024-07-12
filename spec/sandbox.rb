require "./lib/dmv_data_service"


wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# wa_ev_registrations.each do |vehicle|

#   puts vehicle[:vin_1_10]

# end

puts wa_ev_registrations