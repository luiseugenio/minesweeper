class Flag 

	attr_accessor :type

	TYPE = { question_mark: 'Q', red_flag: 'R' }

	def initialize(type)
		@type = type
	end

end