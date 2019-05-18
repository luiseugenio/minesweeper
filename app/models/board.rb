class Board

	attr_accessor :x, :y, :num_mines, :elements

	def initialize(x, y, num_mines)
		@x = x
	  @y = y
	  @num_mines = num_mines

	  setup_new_board
	end

	def move(x, y)
    return 'mine'     if @elements[x][y].mine?
    return 'revealed' if @elements[x][y].revealed?
    @elements[x][y].click
	end

	def flag(x, y)
		if @elements[x][y].flagged? 
			@elements[x][y].unflag
			return 'unflagged'
		else
			@elements[x][y].flag
			return 'flagged'
		end
	end

	def status
		board = ''
    @y.times do |y|
      @x.times do |x|
        if @elements[y][x].mine?
          board << 'B'
        elsif !@elements[y][x].revealed?
          board << '*'
        elsif @elements[y][x].flagged?
          board << 'F'
        else
          board << 'R'
        end
      end
      board << "\n"
    end
		board
	end

	private
	def setup_new_board
		@mines = []
		@elements = Array.new(y) { |y| Array.new(x) { |x| Element.new(x, y) } }

		build
	end

	def build
		while @mines.count < @num_mines do
      x = rand(@x)
      y = rand(@y)

      if !@mines.include?(@elements[y][x])
        @elements[y][x].mine = true
        @mines << @elements[y][x]
      end
		end
	end

end