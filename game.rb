require_relative "character"
require_relative "board"
require_relative "maps"
require 'paint'
require 'terminal-table'
class Game
	def initialize
		@score = 0
		@map = Map.new
		@choices = ["\u{1f60e}", "\u{1f4a9}", "\u{1f63A}", "\u{1f608}", "\u{1F607}"]
	end

	def character_choice
		print "\nPlease choose your player"
		hashes = Hash[@choices.map.with_index.to_a]	
		hashes.each do |symbol, number| 
			puts "\n#{number+1}. #{symbol}"
		end	
		choice = answer

		return @choices[choice-1]
	end

	def answer
		return STDIN.getch.to_i
	end

	def map_choice
		print %q{Please choose a map
		1) whiteboard
		2) the grid
		3) iphone
		}
		map_no = answer

		return @map.map_list[map_no-1]
	end

	def menu
		#start the game
		puts "\nThe controls are the following:
	w - up
	a - left
	s - down
	d - right

Press any key to continue"

		input = STDIN.getch

		return false
	end

	def score(score)
		@score = score
		puts "Congratulation you scored a time of #{@score}"
		#display highscore
	end
end


