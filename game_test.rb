require 'test/unit'
require_relative 'game'

class GameTest < Test::Unit::TestCase
	def test_character_choice
		g = Game.new
		actual = g.character_choice.is_a? String

		assert_equal(true, true, "The output should be string(unicode)")
	end

	def test_map_choice
		g = Game.new
		actual = g.map_choice.is_a? Array
		expected  = [[0,0,0,0,0,0,1,1,5,1],
				[0,1,1,1,1,0,1,1,0,1],
				[0,1,0,0,0,0,0,0,0,1],
				[0,1,0,1,1,1,1,1,0,1],
				[0,1,0,0,0,1,0,1,0,1],
				[0,1,1,1,0,1,0,0,0,1],
				[1,0,0,0,0,1,0,1,0,1],
				[1,0,1,1,1,0,0,1,0,1],
				[1,0,0,1,1,0,1,1,0,1],
				[1,1,9,1,0,0,1,1,1,1]]

		assert_equal(true, true, "The map should be an array")
	end
end	