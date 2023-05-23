require 'sinatra'
require_relative 'person'
require_relative 'capitalized_decorator'
require_relative 'trim_decorator'

get '/' do
  erb :index
end

post '/process' do
  age = params[:age].to_i
  name = params[:name]
  person = Person.new(age, name: name)
  capitalized_person = CapitalizedDecorator.new(person)
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

  @original_name = person.correct_name
  @capitalized_name = capitalized_person.correct_name
  @capitalized_trimmed_name = capitalized_trimmed_person.correct_name

  erb :result
end
