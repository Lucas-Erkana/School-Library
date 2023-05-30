require './data_store'

def hello_message
  app = App.new
  puts ['Welcome to School Library App !', '']
  app
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? '
  print '[Input the number ]: '
end

def display_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts 'Q - Quit'
end

def checking_options(app)
  number = nil
  until number == 'Q'
    display_options
    input = gets.chomp
    puts 'This option is invalid, please select a number from [1..7]' if input < '1' || input > '7'
    process_data(input, app)
  end
end

def person_option(option, app)
  case option
  when 1
    app.handle_st_input
  when 2
    app.handle_tr_input
  else
    puts 'This option is invalid, please select a number from [1..2]'
    option = gets.to_i
    person_option(option, app)
  end
end

def process_data(input, app)
  case input
  when '1'
    app.list_books
  when '2'
    app.list_people
    save_data('people_list', app.people_list)
  when '3'
    create_person
    option = gets.to_i
    person_option(option, app)
  when '4'
    app.create_book
    save_data('books_list', app.book_list)
  when '5'
    app.create_rental
    save_data('rentals_list', app.rentals_list)
  when '6'
    app.list_rentals
  when 'Q'
    puts 'Exiting program...'
  else
    puts 'This option is invalid, please select a number from [1..7]'
  end
end
