class Board

	attr_accessor :width, :height, :num_mines, :elements

	def initialize(width, height, num_mines)
		@width = width
	  @height = height
	  @num_mines = num_mines
	  @elements = Array.new(height) { Array.new(width, Element.new) }
	end

end