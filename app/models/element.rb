class Element

	attr_accessor :x, :y, :mine, :revealed, :flagged

  def initialize(x, y, mine = false)
    @x        = x
    @y        = y
    @mine     = mine
    
    @revealed = false
    @flagged  = nil
  end

  def click
    @revealed = true
	end

	def flagged?
		@flagged.present?	
	end

	def flag(type)
		@flagged = Flag.new(type) 
	end

end