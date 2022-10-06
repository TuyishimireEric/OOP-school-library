require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rentals

  def add_rentals(date, book)
    Rentals.new(date, book, self)
  end

  def can_use_services?
    of_age? >= 18 || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
