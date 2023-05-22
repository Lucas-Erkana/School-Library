require_relative 'person'

class Teacher < Person
  def initialize(age, parent_permission: true,
                 name: 'Unknown', specialization: nil)
    super(age, parent_permission: parent_permission,
               name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
