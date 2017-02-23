require "IO/console"
require_relative 'board'

class Character

	def initialize(board, character)
		@character = character
		@board = board
	end

	def find_coordinate() 
		coordinates = []
		#finds the y coordinate of the character
		#returns an index which is the y coordinate
			y = 0
			while y < @board.length
				if @board[y].include? @character
					coordinates << y
				end
			y += 1
			end

		#finds the x coordinate of the character by looking through each row for that specific character
		#returns an index which is the x coordinate
			@board.each do |row|
				if row.include? @character
					x = row.index(@character)
					coordinates << x
				end
			end	

			return coordinates
	end

	def move_character(coordinates, clear_path, obstacle)
		x = coordinates[0]
		y = coordinates[1]

		control = STDIN.getch

		case control
			when 'a'
			if y != 0 && @board[x][y-1] != obstacle
				@board[x][y] = clear_path
				@board[x][y-1] = @character
			end
			when 'd' 
			if y != (@board.length-1) && @board[x][y+1] != obstacle
				@board[x][y] = clear_path
				@board[x][y+1] = @character
			end
			when 's'
			if x != (@board.length-1) && @board[x+1][y] != obstacle
				@board[x][y] = clear_path
				@board[x+1][y] = @character 
			end
			when 'w'
			if x != 0 && @board[x-1][y] != obstacle
				@board[x][y] = clear_path
				@board[x-1][y] = @character 
			end
		end
	end

	def place_character(start)
		@board[start[0]][start[1]] = @character
		return @board[start[0]][start[1]]
	end

end








