require_relative 'nameable'

class CapitalizedDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
