require_relative './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end
