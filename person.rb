require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  attr_reader :id # getter
  attr_accessor :name, :age # getter and setter

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? >= 18 || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
