class Book
  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(date, person)
    @rentals = Rental.new(date, self, person)
  end

  attr_accessor :title, :author, :rentals
end
