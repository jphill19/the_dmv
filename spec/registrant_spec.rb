require 'spec_helper'



RSpec.describe Registrant do

  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it 'accepts proper values only' do
      # registrant_bad_name = Registrant.new(13, 15, false )
      # registrant_bad_age = Registrant.new("Timmy", 13.1)
      # registrant_bad_data = Registrant.new("Timmy", 15, "yes")
      #bad name test
      expect {Registrant.new(13, 15, false ) }.to raise_error(TypeError, "Name must be a String")

      #bad age test
      expect {Registrant.new("Timmy", 13.1) }.to raise_error(TypeError, "Age must be an Integer")

      #bad license_data test
      expect {Registrant.new("Timmy", 15, "yes")}.to raise_error(TypeError, "License_data must be a Boolean")

  end

end

 





end