require "spec_helper"

RSpec.describe FacilityBuilder do
  before(:each) do
    @facility_builder = FacilityBuilder.new
    @co_dmv_offices = DmvDataService.new.co_dmv_office_locations
    @ny_data = DmvDataService.new.ny_dmv_office_locations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@facility_builder).to be_an_instance_of(FacilityBuilder)
      expect(@facility_builder.co_facilities).to eq([])
    end

  end

  describe "#create_co_facilities" do
    it "can create new facility objects" do
      expect(@facility_builder.create_co_facilities(@co_dmv_offices)[0]).to be_an_instance_of(Facility)
    end
    
    it "stores each colorado facility created in @co_facilities" do
      expect(@facility_builder.create_co_facilities(@co_dmv_offices)).to eq(@facility_builder.co_facilities)
    end

    it "it creates a facility object for each facility coming from the api" do
      expect(@facility_builder.create_co_facilities(@co_dmv_offices).length).to eq(@co_dmv_offices.length)
    end

    it "adds the services retrieved from the api to the co_facilities" do
      expect(@facility_builder.create_co_facilities(@co_dmv_offices)[0].services).to eq(['Vehicle Registration','Renew Drivers License'])
    end

    it "creates facilities objects with the appropriate information" do
      @facility_builder.create_co_facilities(@co_dmv_offices)

      expect(@facility_builder.co_facilities[0].name). to eq("DMV Tremont Branch")
      expect(@facility_builder.co_facilities[0].address). to eq("2855 Tremont Place Suite 118 Denver CO 80205")
      expect(@facility_builder.co_facilities[0].phone). to eq("(720) 865-4600")
    end

    it "every attribute for each facility has a value (a truthy value) " do
      @facility_builder.create_co_facilities(@co_dmv_offices)

      @facility_builder.co_facilities do |facility|
        expect(facility.name).to be_truthy
        expect(facility.address).to be_truthy
        expect(facility.phone).to be_truthy

      end
    end
  end

  describe "#create_ny_facilities" do
    it "can create new facility objects" do
      expect(@facility_builder.create_ny_facilities(@ny_data)[0]).to be_an_instance_of(Facility)
    end

  end


end