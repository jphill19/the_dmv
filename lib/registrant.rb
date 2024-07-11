#type error link: https://www.exceptionalcreatures.com/bestiary/TypeError.html

class Registrant

  def initialize(name, age, license_data = false)
    raise TypeError, "Name must be a String" unless name.is_a?(String)
    raise TypeError, "Age must be an Integer" unless age.is_a?(Integer)
    raise TypeError, "License_data must be a Boolean" unless [TrueClass, FalseClass].include?(license_data.class)

    @name = name
    @age = age
    @license_data = license_data
  end

end