require_relative 'cookbook'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
end
