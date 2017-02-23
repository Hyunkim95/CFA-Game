
['board', 'character', 'game', 'maps'].each{ |f| require_relative f }
require 'terminal-table'
require 'csv'
#==============================================================================
#prints starting menu

rows = []
rows << ["Press 1 to start game" ]
rows << :separator
rows << ["Press 2 to quit the game,"]
table = Terminal::Table.new :headings => ['Main Menu'], :rows => rows
puts table

response = gets.chomp.to_i


#==============================================================================
#This creates the game and loads the menu
if response == 1
	new_game = Game.new

	action_not_done = true

	while action_not_done
		action_not_done = new_game.menu
	end
else 
    exit
end

#==============================================================================
#This creates the character, board and maps
character = new_game.character_choice
map = new_game.map_choice
board = Board.new(map)
c = Character.new(board.board, character)
#d = Character.new(board.board, "\u{26C5}")
board.paint_board

#==============================================================================
#clears the board, identifies the starting position on map, places character and 
#shows it on the board
system('clear')

start = board.find_coordinate(Paint[5,:red])
finish = board.find_coordinate(Paint[9, :white])
c.place_character(start)
#d.place_character(finish)

board.show_board

#==============================================================================
#finds the x and y coordinates of the finish 
finish_x = board.find_coordinate(Paint[9,:white])[0].to_i
finish_y = board.find_coordinate(Paint[9,:white])[1].to_i

#continues loop until the character is on the finish array
before = Time.now #time when loop starts
while board.board[finish_x][finish_y] != character do 
	c.move_character(c.find_coordinate, Paint[0, :black], Paint[1, :red])
	system('clear') #clears the board to make it look clean
	board.show_board
end
after = Time.now #time when loop finishes

#==============================================================================

#stores highscore into database and outputs it on screen
puts "What is your Name?"
input = gets.chomp
new_game.score(after-before)

CSV.open("Maze.csv", 'a+') do |csv_file|
 csv_file << [input, after-before]
end
h=Hash.new
CSV.foreach("Maze.csv",headers:true) do |row|
        x=row["Name"]
        h[x] = row["Score"].to_f
end

puts "\nHIGHSCORE"

h=h.sort_by{|k,v| v}

h.each do |key , value|
    puts "#{key}\t #{value.round(4)}"
end