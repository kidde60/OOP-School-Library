require_relative 'nameable'
class Decorator < Nameable
  def initialize(nameable_object)
    super()
    @nameable = nameable_object
  end

  def correct_name
    @nameable.correct_name
  end
end
