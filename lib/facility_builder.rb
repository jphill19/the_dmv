class FacilityBuilder

  attr_reader :co_facilities
  def initialize
    @co_facilities = []
  end


  def create_co_facilities(data)

    data.each do |data|
      new_facility = Facility.new({
        name: data[:dmv_office],
        address: "#{data[:address_li]} #{data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}",
        phone: data[:phone]
      })

      if data[:services_p].include?('registration')

        new_facility.add_service("Vehicle Registration")
      end

      if data[:services_p].include?("renewals")
        new_facility.add_service("Renew Drivers License")
      end

      @co_facilities << new_facility

    end
    return @co_facilities
  end

end