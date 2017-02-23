require 'test/unit'
require_relative 'character'

class CharacterTest < Test::Unit::TestCase
	def test_find_coordinate
		map = [[2,0,0],[0,0,0],[0,0,0]]
		c = Character.new(map, 2)

		actual = c.find_coordinate()

		assert_equal([0,0], actual, "coordinate should equal [0,0]")
	end

	def test_place_character 
		map = [[0,0,0],[0,0,0],[0,0,0]]
		c = Character.new(map, 2)

		actual = c.place_character([0,0])

		assert_equal(2, actual, "It should equal 2")

	end
end	