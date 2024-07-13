require "spec_helper"

RSpec.describe FacilityBuilder do
  before(:each) do
    @facility_builder = FacilityBuilder.new
    @co_dmv_offices = DmvDataService.new.co_dmv_office_locations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@facility_builder).to be_an_instance_of(FacilityBuilder)
    end

  end


end