require 'paint'

class Board
	def initialize(map) #input board
		@board = map
		@painted_board = map
	end

	attr_accessor :board

	def show_board
		@painted_board.each do |array|
			row = array.join(" ")
			puts "#{row}"
		end
	end

	def find_coordinate(variable) 
		coordinates = []
		y = 0
		while y < @board.length
			if @board[y].include? variable
				coordinates << y
			end
		y += 1
		end

		@board.each do |row|
			if row.include? variable
				x = row.index(variable)
				coordinates << x
			end
		end	

		return coordinates
	end

	def paint_board
		@painted_board.each do |array|
			array.map! do |tile|
				if tile == 0
					Paint[tile, :black]
				elsif tile == 9
					Paint[tile, :white]
				else
					Paint[tile, :red]
				end
			end
		end
	end
end







