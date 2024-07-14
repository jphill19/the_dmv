require "spec_helper"

RSpec.describe FacilityBuilder do
  before(:each) do
    @facility_builder = FacilityBuilder.new
    @co_dmv_offices = DmvDataService.new.co_dmv_office_locations
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

  end


end