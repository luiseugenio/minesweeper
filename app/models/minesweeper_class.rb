class MinesweeperClass
	
	attr_accessor :board

  def initialize(x, y, qtd_mines)
    raise ArgumentError, 'too many mines' if qtd_mines > (x * y)
    @board = Board.new(x, y, qtd_mines)
  end

  def play(x, y)
    clicked = @board.click(x, y)
    case clicked
    when 'mine'
    	game_over
    when 'flagged'
    	flagged
    when 'revealed'
    	revealed
    else
    	print @board.status
    end
  end

  def flag(x, y, type)
    @board.flag(x, y, type)
    print @board.status
  end

  def status
  	print @board.status
  end

  private

  def game_over
    puts 'Game Over! You exploded.'
    return
  end

  def revealed
    puts 'Already Revealed.'
    return
	end

	def flagged
    puts 'Flagged.'
    return
	end
	
end