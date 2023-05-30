require './person'

class Student < Person
  def initialize(age, name, parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.includes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
