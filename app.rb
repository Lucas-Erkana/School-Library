require './book'
require './rental'
require './classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'

class App
  attr_accessor :people_list, :book_list, :rental_list

  def initialize
    @people_list = []
    @book_list = []
    @rental_list = []
  end

  def list_books
    if @book_list.empty?
      puts 'There are no books yet'
      return
    end

    @book_list.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    if @people_list.empty?
      puts 'There is no people'
    else
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)? [Input the number 1 or 2]: '
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp

    student = Student.new(age, name, parent_permission: permission)
    @people_list.push(student)
    puts 'Student Created Successfully'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    print 'Specialization:'
    specialization = gets.chomp

    @people_list << Teacher.new(age, name, specialization: specialization)
    puts 'Teacher Created Successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book_list << book

    puts 'Book created successfully'
  end

  def create_rental
    if @book_list.empty?
      puts 'No book record found'
    elsif @people_list.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number '
      @book_list.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number '
      @people_list.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name : #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rental_list << Rental.new(date, @book_list[book_index], @people_list[person_index])
      puts 'Rental created successfully '
    end
  end

  def list_rentals
    print 'ID of person : '
    id = gets.chomp.to_i

    rentals = @rental_list.filter { |rental| rental.person.id == id }

    puts 'Rentals :'
    rentals.each do |rental|
      puts "Date : #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
