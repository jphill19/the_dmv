#type error link: https://www.exceptionalcreatures.com/bestiary/TypeError.html

class Registrant

  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit = false)
    raise TypeError, "Name must be a String" unless name.is_a?(String)
    raise TypeError, "Age must be an Integer" unless age.is_a?(Integer)
    raise TypeError, "permit must be a Boolean" unless permit.is_a?(TrueClass) || permit.is_a?(FalseClass)

    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}

  end

  def permit?

  end


end