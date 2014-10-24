

class Rover
	attr_accessor :x, :y, :direction, :world_width, :world_height
	def initialize(x, y)
		@world_width = x
		@world_height = y
	end

	def set_position(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end


	def move
		case @direction
		when "N"
			@y +=1
		when "S"
			@y -=1
		when "E"
			@x +=1
		when "W"
			@x -=1
		else 
			raise  "error in your move, tried to use #{@direction} which is invalid"
		end
		#sanity check to make sure it's in-bounds
		@y = [@y, world_height].min
		@y = [@y, 0].max
		@x = [@x, world_width].min #making sure rover doesn't go out of plateu
		@x = [@x, 0].max #PACMAN EQUATION GOES HERE USE OF MOD (%)
	end

	def turn(direction)
		d = @direction.tr("NESW", "0123").to_i
		if direction == "L"
			d = (d-1) % 4
		elsif direction == "R" #mod 4 because 4 directions.
			d = (d+1) % 4
		else 
			raise "your direction is neither L or R it is #{direction}"
		end
		@direction = d.to_s.tr("0123", "NESW")
	end

	def position
		"#{x} #{y} #{direction}" #display position for user
	end
			
	def read_instruction(instruction)
			case instruction
			when "M"
				move
			when "L", "R"
				turn(instruction)
			else 
				raise "invalid instruction #{instruction} in read_instruction"
			end
	end
end

def prompt
	line = gets
	exit if line.nil? or line.strip.empty?
	line.strip
end

puts "Please enter the world size in the following format"
puts "Format: x y.  No greater than 9 for either value."
world_height, world_width = prompt.split(" ").map { |s| s.to_i } #setting the size of plateu (HOLY SHIT THIS IS COOL)
mars_rover = Rover.new(world_width, world_height)
loop do
	puts "enter the starting position of the rover"
	x, y, direction = prompt.split(" ")
	x = x.to_i
	y = y.to_i
	mars_rover.set_position(x, y, direction)
	puts "enter rover commands pls"
	instructions = prompt.upcase
	instructions.each_char do |character|
		mars_rover.read_instruction(character)
	end
	puts "#{mars_rover.position}"
end

#part of an alternate version

	# def turnleft
	# 	case @direction
	# 	when "N"
	# 		@direction = "W"
	# 	when "W"
	# 		@direction = "S"
	# 	when "S"
	# 		@direction = "E"
	# 	when "E"
	# 		@direction = "N"
	# 	else
	# 		raise "Error you are not facing any direction"
	# 	end
	# end

	# def turnright
	# 	case @direction
	# 	when "N"
	# 		@direction = "E"
	# 	when "E"
	# 		@direction = "S"
	# 	when "S"
	# 		@direction = "W"
	# 	when "W"
	# 		@direction = "N"
	# 	else 
	# 		raise "Error you are not facing any direction"
	# 	end
	# end
