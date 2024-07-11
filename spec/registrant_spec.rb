require 'spec_helper'



RSpec.describe Registrant do

  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'accepts proper values only' do
      #bad name test
      expect {Registrant.new(13, 15, false ) }.to raise_error(TypeError, "Name must be a String")

      #bad age test
      expect {Registrant.new("Timmy", 13.1) }.to raise_error(TypeError, "Age must be an Integer")

      #bad permit test
      expect {Registrant.new("Timmy", 15, "yes")}.to raise_error(TypeError, "permit must be a Boolean")

  end

end

 





end