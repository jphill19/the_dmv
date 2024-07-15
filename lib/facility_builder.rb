class FacilityBuilder

  attr_reader :co_facilities, :ny_facilities, :mo_facilities
  def initialize
    @co_facilities = []
    @ny_facilities = []
    @mo_facilities = []
  end


  def create_co_facilities(data)

    data.each do |data|
      data.default = "not available"
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

  def create_ny_facilities(data)

    @ny_facilities = data.map do |data|
      data.default = "not available"

      new_facility = Facility.new({
        name: "#{data[:office_name]} #{data[:office_type]}",
        address: "#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}",
        phone: data[:public_phone_number]
      })
    end
    return @ny_facilities
  end


  def create_mo_facilities(data)

    @mo_facilities =  data.map do |data|
      data.default = "not available"
      new_facility = Facility.new({
        name: "#{data[:name]}",
        address: "#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zipcode]}",
        phone: data[:phone]
      })

    end
    return @mo_facilities
  end



end