class Node

	attr_accessor :value, :combinations
	attr_reader :column, :row

	def initialize(column, row)
		@value = nil
		@combinations = []
		@column = column
		@row = row
	end
end