require './app'
require_relative 'interface'

class Main
  def initialize
    @app = App.new
  end

  def run
    Interface.new(@app).start
  end
end

main = Main.new
main.run
