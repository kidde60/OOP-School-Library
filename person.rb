require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    @is_of_age || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
