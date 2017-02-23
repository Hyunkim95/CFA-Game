require 'test/unit'
require_relative 'board'

class BoardTest < Test::Unit::TestCase
	def test_find_coordinate
		b = Board.new([
			[0,0,0],
			[0,2,0],
			[0,0,0]
			])

		actual = b.find_coordinate(2)

		assert_equal([1,1], actual, "This value should equal [1,1]")
	end

	def test_paint_board
		b = Board.new([
			[9,0,0],
			[0,0,0],
			[0,0,1]
			])

		b.paint_board

		expected = Paint[9, :white]

		assert_equal(expected, b.board[0][0], "This tile should be white")
	end
end	