require './app'

class Main
  MENU_OPTIONS = {
    '1' => :handle_list_books,
    '2' => :handle_list_people,
    '3' => :handle_create_person,
    '4' => :handle_create_book,
    '5' => :handle_create_rental,
    '6' => :handle_list_rentals,
    '7' => :handle_exit
  }.freeze

  def initialize
    @app = App.new
    @menu_handler = MenuHandler.new(@app)
  end

  def run
    display_welcome_message
    process_menu_options
    display_exit_message
  end

  private

  def process_menu_options
    loop do
      display_menu
      option = gets.chomp

      if MENU_OPTIONS.key?(option)
        send(MENU_OPTIONS[option])
      else
        puts 'That is not a valid number'
      end

      break if option == '7' # Exit the loop if '7' is entered
    end
  end

  def handle_list_books
    @menu_handler.list_books
  end

  def handle_list_people
    @menu_handler.list_people
  end

  def handle_create_person
    @menu_handler.create_person
  end

  def handle_create_book
    @menu_handler.create_book
  end

  def handle_create_rental
    @menu_handler.create_rental
  end

  def handle_list_rentals
    @menu_handler.list_rentals
  end

  def handle_exit
    # No need to perform any action, just exit the loop
  end

  def display_welcome_message
    puts 'Welcome to the School Library App!'
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def display_exit_message
    puts 'Thank you!'
  end
end

class MenuHandler
  def initialize(app)
    @app = app
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end
end

main = Main.new
main.run
