require './app'

class Interface
  OPTION_ACTIONS = {
    '1' => :handle_list_books,
    '2' => :handle_list_people,
    '3' => :handle_create_person,
    '4' => :handle_create_book,
    '5' => :handle_create_rental,
    '6' => :handle_list_rentals,
    'q' => :quit
  }.freeze

  def initialize(app)
    @app = app
  end

  def start
    puts 'Welcome to School Library App!'
    loop do
      display_options
      option = gets.chomp

      handle_option(option.downcase)

      puts ' '
      break if option.downcase == 'q'
    end

    puts 'Thank you! You are always welcome.'
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

  def handle_option(option)
    action = OPTION_ACTIONS[option]
    if action
      send(action)
    else
      puts '*************************************' unless option.downcase == 'q'
      puts 'That is not a valid number or option' unless option.downcase == 'q'
      puts '*************************************' unless option.downcase == 'q'
    end
  end

  def handle_list_books
    @app.list_books
  end

  def handle_list_people
    @app.list_people
  end

  def handle_create_person
    @app.create_person
  end

  def handle_create_book
    @app.create_book
  end

  def handle_create_rental
    @app.create_rental
  end

  def handle_list_rentals
    @app.list_rentals
  end

  def quit
    # No action required for quitting
  end
end
