class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0...10] : name
  end
end
