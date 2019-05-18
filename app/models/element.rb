class Element

	attr_accessor :x, :y, :mine, :revealed, :flagged

	def initialize(x, y, mine = false)
	  @x        = x
    @y        = y
    @mine     = mine

    @revealed = false
		@flagged = false
	end

 	def click
    @revealed = true
	end

	def revealed?
    @revealed
  end

  def mine?
    @mine
  end

  def flagged?
    @flagged
  end

  def flag
    @flagged = true
  end

  def unflag
    @flagged = false
end

end