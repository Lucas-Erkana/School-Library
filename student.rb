require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission: true, name: 'Unknown', classroom: nil)
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
