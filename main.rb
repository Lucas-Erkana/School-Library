require_relative 'person'
require_relative 'capitalized_decorator'
require_relative 'trim_decorator'

person = Person.new(22, name: 'maximilianus')
puts "Original name: #{person.correct_name}"

capitalized_person = CapitalizedDecorator.new(person)
puts "Capitalized name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed name: #{capitalized_trimmed_person.correct_name}"
