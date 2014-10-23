class Rover
	attr_accessor :x, :y, :direction
	def initialized(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end

	def move 
		case @direction
		when "N"
			@y += 1
		when "S"
			@y -= 1
		when "E"
			@x += 1
		when "W"
			@x -= 1
		else
			puts "Error unrecognized direction"
		end
	end	

	def turnleft
		case @direction
		when "N"
			@direction = "W"
		when "W"
			@direction = "S"
		when "S"
			@direction = "E"
		when "E"
			@direction = "N"
		else
			raise "Error you are not facing any direction"
		end
	end

	def turnright
		case @direction
		when "N"
			@direction = "E"
		when "E"
			@direction = "S"
		when "S"
			@direction = "W"
		when "W"
			@direction = "N"
		else 
			raise "Error you are not facing any direction"
		end
	end

	def readinstruction
		listofcommands = "List of commands: Move, Turn Left, Turn Right"
end


