require 'spec_helper'



RSpec.describe Registrant do

  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
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
    it "has writtable attributes that can have its value changed" do
      @registrant_1.license_data = {:written=>true, :license=>false, :renewed=>false}
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

  end

  describe '#permit?' do
    it 'can determine if the registrant has a permit' do

      expect(@registrant_1.permit?).to eq(true)
    end

    it' can determine the user has no permit, if no permit data is passed' do
      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#earn_permit' do
    it 'can change the value of permit to true' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end

    it 'does not interfere with registrants with permits' do
      @registrant_1.earn_permit
      expect(@registrant_1.permit?).to eq(true)
    end
  end





end