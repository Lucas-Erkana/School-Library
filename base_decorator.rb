require_relative './nameable'

class BaseDecorator < Nameable
  def initialize(nameable_obj)
    super()
    @nameable_obj = nameable_obj
  end
  attr_accessor :nameable_obj

  def correct_name
    @nameable_obj.correct_name
  end
end
