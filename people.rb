class Person
	attr_accessor :name
	def initialize(name)
		@name = name
	end 

	def greeting
		puts "Hi my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object!"
	end
end

chris = Instructor.new("Chris")

christina = Student.new("Christina")

Chris.greeting

Christina.greeting

Chris.teach

Christina.learn

#It doesn't work because the Instructor class is not a parent or child class of 
#student so it does not inherit the teach method
