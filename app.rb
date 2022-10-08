require './person'
require './book'
require './rental'
require './teacher'
require './student'
require 'date'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts '

      **************Book store is Empty*****************'
    else
      @books.each_with_index { |book, index| puts "#{index}) title: #{book.title} author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts '

      ************No person registered yet************'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) ID: #{person.id} name: #{person.name} age: #{person.age}"
      end
    end
  end

  def add_person
    print 'Do you whant to create a Student (1) 0r Teacher (2)? [input the number]: '
    job = gets.chomp.to_i
    case job
    when 1
      print 'name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Has parent permissiom [Y/N]? '
      permission = gets.chomp.downcase

      case permission
      when 'y'
        parent_permission = true
      when 'n'
        parent_permission = false
      else
        puts '

        ********************Invalid input*****************'
        main
      end

      student = Student.new(age, name, parent_permission: parent_permission)
      @people.push(student)
      puts '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       Student created successfully!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    when 2
      print 'name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)
      puts '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      Teacher created successfully!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(author, title)
    @books.push(book)
    puts '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      Book created successfully!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def add_rental
    puts 'Select Book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select Person from the following list by number'
    list_people
    person_index = gets.chomp.to_i
    puts "Date: #{Date.today}"
    date = gets.chomp
    rental = Rental.new(date, books[book_index], people[person_index])
    @rentals.push(rental)
    puts '
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rental created successfully!
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def list_rentals
    list_people
    print 'ID of person: '
    id = gets.chomp.to_i
    person = @people.select { |x| x.id == id }[0]
    if person
      person.rentals.each { |rental| puts "Date: #{rental.date} book, #{rental.book.title} by #{rental.book.author}" }
    else
      puts '

      ***************Wrong input please try again!!*************'
    end
  end

  def exit_method
    abort '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      Thank you for using the OOP School Library App!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end
end
