require_relative 'classroom'
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'input'

class App
  attr_accessor :people_list, :book_list, :rental_list

  def initialize
    @people_list = []
    @book_list = []
    @rental_list = []
    @input = Input.new
  end

  def list_books
    if @book_list.empty?
      puts 'There are no books yet'
    else
      @book_list.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people_list.empty?
      puts 'There are no people'
    else
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_person
    input_result = @input.person_input

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input. Please select 1 for student or 2 for teacher.'
    end
  end

  def create_student
    age = @input.age_input
    name = @input.name_input
    permission = @input.parent_permission_input

    student = Student.new(age, name, parent_permission: permission)
    @people_list << student
    puts 'Student created successfully'
  end

  def create_teacher
    age = @input.age_input
    name = @input.name_input
    specialization = @input.specialization_input

    teacher = Teacher.new(age, name, specialization: specialization)
    @people_list << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    title = @input.title_input
    author = @input.author_input

    book = Book.new(title, author)
    @book_list << book

    puts 'Book created successfully'
  end

  def create_rental
    return puts 'No book records found' if @book_list.empty?
    return puts 'No person records found' if @people_list.empty?

    display_books
    book_index = @input.book_index_input(@book_list.size)

    display_people
    person_index = @input.person_index_input(@people_list.size)

    date = @input.date_input

    rental = Rental.new(date, @book_list[book_index], @people_list[person_index])
    @rental_list << rental

    puts 'Rental created successfully'
  end

  def list_rentals
    if @rental_list.empty?
      puts 'No rental records found'
      return
    end

    id = @input.person_id_input

    rentals = @rental_list.filter { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found for the specified person ID'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  private

  def display_books
    puts 'Select a book from the following list by number:'
    @book_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_people
    puts 'Select a person from the following list by number:'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

app = App.new
app.create_rental
app.list_rentals
