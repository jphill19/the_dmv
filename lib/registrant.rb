#type error link: https://www.exceptionalcreatures.com/bestiary/TypeError.html

class Registrant

  def initialize(name, age, license_data = false)
    raise TypeError, "Name must be a String" unless name.is_a?(String)
    raise TypeError, "Age must be an Integer" unless age.is_a?(Integer)

    @name = name
    @age = age
    @license_data = license_data
end