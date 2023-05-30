require './student'
require './teacher'
require './book'
require './person'
require './rental'

class App
  def initialize
    @people = []
    @book = []
    @rentals = []
  end

  def list_books
    if @book.empty?
      puts 'There is no book avilable'
      return
    end
    @book.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'There is no people avilable'
      return
    end
    @people.each do |person|
      puts "[#{person.class}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    user_input = gets.chomp.to_i

    case user_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input, person not created'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permisson? [Y?N]: '
    permisson = gets.chomp.downcase
    @people << Student.new(age, name, parent_permission: permisson)
    puts 'Student created successfuly!'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book << Book.new(title, author)
    puts 'Book created successfully!'
  end

  def create_rental
    if @book.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person reord found'
    else
      puts 'Select a book from the following list by number (not ID)'
      @book.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @people[person_index], @book[book_index])
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
