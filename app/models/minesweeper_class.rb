class MinesweeperClass
	
	attr_accessor :board

	def initialize(x, y, num_mines)
		@board = Board.new(x, y, num_mines)
	end

	def play(x, y)
    response = @board.move(x, y)
    case response
  	when 'mine' 
  		game_over
  	when 'revealed' 
  		revealed
  	end
  	@board.status
  end

  def flag(x, y)
    @board.flag(x, y)
  end

  private
  def game_over
    puts 'You lose.'
    return
  end

  def revealed
    puts 'already revealed'
    return
	end

	
end