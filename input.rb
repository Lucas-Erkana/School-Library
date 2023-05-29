class Input
  def person_input
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number 1 or 2]: '
    gets.chomp.to_i
  end

  def age_input
    print 'Age: '
    gets.chomp
  end

  def name_input
    print 'Name: '
    gets.chomp
  end

  def parent_permission_input
    print 'Has Parent permission? [Y/N]: '
    gets.chomp
  end

  def specialization_input
    print 'Specialization: '
    gets.chomp
  end

  def title_input
    print 'Title: '
    gets.chomp
  end

  def author_input
    print 'Author: '
    gets.chomp
  end

  def book_index_input(max_index)
    print "Select a book by number [0-#{max_index - 1}]: "
    gets.chomp.to_i
  end

  def person_index_input(max_index)
    print "Select a person by number [0-#{max_index - 1}]: "
    gets.chomp.to_i
  end

  def date_input
    print 'Date: '
    gets.chomp
  end

  def person_id_input
    print 'ID of person: '
    gets.chomp.to_i
  end
end
