require_relative 'preserve_data'

class Loader
  def initialize(app)
    @handle_data = HandleData.new
    @app = app
  end

  def load_books
    books = @handle_data.read_data('books.json') if File.exist?('books.json')
    return unless books

    books.each do |book|
      @app.create_book_from_file(book['title'], book['author'])
    end
  end

  def load_persons
    persons = @handle_data.read_data('person.json') if File.exist?('person.json')
    return unless persons

    persons.each do |person|
      if person['type'] == 'Student'
        @app.create_student_from_file(person['name'], person['age'], person['parent_permission'])
      else
        @app.create_teacher_from_file(person['name'], person['age'], person['specialization'])
      end
    end
  end

  def load_rentals
    rentals = @handle_data.read_data('rentals.json') if File.exist?('rentals.json')
    return unless rentals

    rentals.each do |rental|
      @app.create_rental_from_file(rental['date'], rental['person_idx'], rental['book_idx'])
    end
  end

  def load_all
    load_books
    load_persons
    load_rentals
  end
end
