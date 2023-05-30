require './book'
require './rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require 'json'
class App
  attr_accessor :people_list, :book_list, :rentals_list

  def initialize
    @people_list = []
    @book_list = []
    @rentals_list = []
    base = "#{Dir.pwd}/data"
    books_reader = File.read("#{base}/books_list.json")
    people_reader = File.read("#{base}/people_list.json")
    rentals_reader = File.read("#{base}/rentals_list.json")
    JSON.parse(books_reader).each { |x| @book_list.push(Book.new(x['title'], x['author'])) } unless books_reader == ''

    handle_people(people_reader == '' ? [] : JSON.parse(people_reader))
    handle_rentals(rentals_reader == '' ? [] : JSON.parse(rentals_reader))
  end

  def handle_people(arr)
    arr.each do |person|
      if person['person'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.id = person['id']
        @people_list.push(teacher)
      else
        student = Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        student.id = person['id']
        @people_list.push(student)
      end
    end
  end

  def handle_st_input
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    parent_permission = handle_permission
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'This option is invalid, please choose from Y or N'
      parent_permission = handle_permission
    end
    student = Student.new(age, name, parent_permission: parent_permission)
    @people_list << student
    puts ['Person created succsefully. ', ' ']
  end

  def handle_rentals(arr)
    arr.each do |x|
      find_a_person = @people_list.select { |p| p.id == x['person'] }
      find_a_book = @book_list.select { |b| b.title == x['book'].to_s }
      @rentals_list.push(Rental.new(x['date'], find_a_book[0], find_a_person[0]))
    end
  end

  def handle_permission
    print 'Has Parent permission? [Y/N]: '
    gets.chomp.capitalize
  end

  def handle_tr_input
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, specialization, name)
    @people_list << teacher
    puts ['Person created successfully. ', ' ']
  end

  def books
    @book_list
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
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp

    student = Student.new(age, name, parent_permission: permission)
    @people_list.push(student)
    puts 'Student Created Successfully'
  end

  def create_teacher
    print 'Specialization:'
    specialization = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

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

      @rentals_list << Rental.new(date, @book_list[book_index], @people_list[person_index])
      puts 'Rental created successfully '
    end
  end

  def list_rentals
    print 'ID of person : '
    id = gets.chomp.to_i

    rentals = @rentals_list.filter { |rental| rental.person.id == id }

    puts 'Rentals :'
    rentals.each do |rental|
      puts "Date : #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
