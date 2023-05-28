require './app'

class Interface
  def initialize(app)
    @app = app
  end

  def start
    puts 'Welcome to School Library App!'
    loop do
      display_options
      option = gets.chomp

      case option
      when '1'
        @app.list_books
      when '2'
        @app.list_people
      when '3'
        @app.create_person
      when '4'
        @app.create_book
      when '5'
        @app.create_rental
      when '6'
        @app.list_rentals
      when 'q', 'Q'
        break
      else
        puts 'That is not a valid number or option'
      end

      puts ' '
      puts 'Press any key to continue, or press Q to quit'
      input = gets.chomp
      break if input.downcase == 'q'
    end

    puts 'Thank you!. You are always welcome'
  end

  private

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
end
