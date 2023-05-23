require_relative 'person'
require_relative 'capitalized_decorator'
require_relative 'trim_decorator'

person = Person.new(22, name: 'maximilianus')
puts "Original name: #{person.correct_name}"

capitalizedPerson = CapitalizedDecorator.new(person)
puts "Capitalized name: #{capitalizedPerson.correct_name}"

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts "Capitalized and trimmed name: #{capitalizedTrimmedPerson.correct_name}"
