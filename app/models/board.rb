class Board

	attr_accessor :x, :y, :qtd_mines, :elements, :mines

  def initialize(x, y, qtd_mines)
    @x = x
    @y = y
    @qtd_mines = qtd_mines
    
    build
  end

  def click(x, y)
    return 'mine' if @elements[x][y].mine
    return 'flagged' if @elements[x][y].flagged
    return 'revealed' if @elements[x][y].revealed
    @elements[x][y].click
  end

  def flag(x, y, type)
    @elements[x][y].flag(type)
  end

  def status
    state = ''
    @x.times do |x|
      @y.times do |y|
        if @elements[x][y].mine
          state << 'B'
        elsif @elements[x][y].flagged?
          state << @elements[x][y].flagged.type
        elsif !@elements[x][y].revealed
          state << '?'
        else
          state << 'R'
        end
      end
      state << "\n"
    end
    state
  end

  private

  def build
  	@mines = []
    @elements = Array.new(@x) { |x| Array.new(@y) { |y| Element.new(x, y) } }
    
    while @mines.count < @qtd_mines do
      x = rand(@x)
      y = rand(@y)

      if !@mines.include?(@elements[x][y])
        @elements[x][y].mine = true
        @mines << @elements[x][y]
      end
    end
  end

end