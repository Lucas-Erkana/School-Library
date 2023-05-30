require 'fileutils'
require 'json'

FileUtils.mkdir_p('data')
base = "#{Dir.pwd}/data"
File.open("#{base}/books_list.json", 'w') unless File.exist?("#{base}/books_list.json")
File.open("#{base}/people_list.json", 'w') unless File.exist?("#{base}/people_list.json")
File.open("#{base}/rentals_list.json", 'w') unless File.exist?("#{base}/rentals_list.json")

def save_data(filename, array)
  case filename
  when 'people_list'
    save_people(array)
  when 'rentals_list'
    save_rentals(array)
  when 'books_list'
    save_books(array)
  else
    puts 'Error!'
  end
end

def save_rentals(array)
  base = "#{Dir.pwd}/data"
  empty_array = []
  array.each { |e| empty_array.push({ date: e.date, book: e.book.title, person: e.person.id }) }
  File.write("#{base}/rentals_list.json", empty_array.to_json, mode: 'w')
end

def save_books(array)
  base = "#{Dir.pwd}/data"
  books_array = array.map { |e| { title: e.title, author: e.author } }
  File.write("#{base}/books_list.json", books_array.to_json, mode: 'w')
end

def save_people(array)
  base = "#{Dir.pwd}/data"
  empty_array = []
  array.each do |e|
    empty_array.push({
                       person: e.class,
                       name: e.name,
                       specialization: (e.class.to_s == 'Teacher' ? e.specialization : nil),
                       id: e.id,
                       age: e.age
                     })
  end
  File.write("#{base}/people_list.json", empty_array.to_json, mode: 'w')
end
