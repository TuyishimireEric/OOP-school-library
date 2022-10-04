class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? >= 18 or @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end