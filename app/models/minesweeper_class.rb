class MinesweeperClass
	
	attr_accessor :board

	def initialize(width, height, num_mines)
		@board = Board.new(width, height, num_mines)
	end
	
end