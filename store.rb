require_relative 'preserve_data'

class Store
  def initialize
    @handle_data = HandleData.new
    @people = []
    @books = []
    @rentals = []
  end

  def store_people(file, data)
    @people = @handle_data.read_data(file) if File.exist?(file)
    @people.push(data)
    @handle_data.save_data(file, @people)
  end

  def store_books(file, data)
    @books = @handle_data.read_data(file) if File.exist?(file)
    @books.push(data)
    @handle_data.save_data(file, @books)
  end

  def store_rentals(file, data)
    @rentals = @handle_data.read_data(file) if File.exist?(file)
    @rentals.push(data)
    @handle_data.save_data(file, @rentals)
  end
end
