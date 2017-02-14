require "./lib/node.rb"

class Board

	attr_reader :array_of_nodes, :array_of_4s, :a1, :a2, :a3, :a4, :a5, :a6, :b1, :b2, :b3, :b4, :b5, :b6, :c1, :c2, :c3, :c4, :c5, :c6, :d1, :d2, :d3, :d4, :d5, :d6, :e1, :e2, :e3, :e4, :e5, :e6, :f1, :f2, :f3, :f4, :f5, :f6, :g1, :g2, :g3, :g4, :g5, :g6

	def initialize
		@a1 = Node.new("a", 1)
		@a2 = Node.new("a", 2)
		@a3 = Node.new("a", 3)
		@a4 = Node.new("a", 4)
		@a5 = Node.new("a", 5)
		@a6 = Node.new("a", 6)
		@b1 = Node.new("b", 1)
		@b2 = Node.new("b", 2)
		@b3 = Node.new("b", 3)
		@b4 = Node.new("b", 4)
		@b5 = Node.new("b", 5)
		@b6 = Node.new("b", 6)
		@c1 = Node.new("c", 1)
		@c2 = Node.new("c", 2)
		@c3 = Node.new("c", 3)
		@c4 = Node.new("c", 4)
		@c5 = Node.new("c", 5)
		@c6 = Node.new("c", 6)
		@d1 = Node.new("d", 1)
		@d2 = Node.new("d", 2)
		@d3 = Node.new("d", 3)
		@d4 = Node.new("d", 4)
		@d5 = Node.new("d", 5)
		@d6 = Node.new("d", 6)
		@e1 = Node.new("e", 1)
		@e2 = Node.new("e", 2)
		@e3 = Node.new("e", 3)
		@e4 = Node.new("e", 4)
		@e5 = Node.new("e", 5)
		@e6 = Node.new("e", 6)
		@f1 = Node.new("f", 1)
		@f2 = Node.new("f", 2)
		@f3 = Node.new("f", 3)
		@f4 = Node.new("f", 4)
		@f5 = Node.new("f", 5)
		@f6 = Node.new("f", 6)
		@g1 = Node.new("g", 1)
		@g2 = Node.new("g", 2)
		@g3 = Node.new("g", 3)
		@g4 = Node.new("g", 4)
		@g5 = Node.new("g", 5)
		@g6 = Node.new("g", 6)
		@array_of_nodes = [@a1, @a2, @a3, @a4, @a5, @a6, @b1, @b2, @b3, @b4, @b5, @b6, @c1, @c2, @c3, @c4, @c5, @c6, @d1, @d2, @d3, @d4, @d5, @d6, @e1, @e2, @e3, @e4, @e5, @e6, @f1, @f2, @f3, @f4, @f5, @f6, @g1, @g2, @g3, @g4, @g5, @g6]
		@array_of_4s = [[@a1, @a2, @a3, @a4], [@a2, @a3, @a4, @a5], [@a3, @a4, @a5, @a6], 
						[@b1, @b2, @b3, @b4], [@b2, @b3, @b4, @b5], [@b3, @b4, @b5, @b6], 
						[@c1, @c2, @c3, @c4], [@c2, @c3, @c4, @c5], [@c3, @c4, @c5, @c6], 
						[@d1, @d2, @d3, @d4], [@d2, @d3, @d4, @d5], [@d3, @d4, @d5, @d6], 
						[@e1, @e2, @e3, @e4], [@e2, @e3, @e4, @e5], [@e3, @e4, @e5, @e6], 
						[@f1, @f2, @f3, @f4], [@f2, @f3, @f4, @f5], [@f3, @f4, @f5, @f6], 
						[@g1, @g2, @g3, @g4], [@g2, @g3, @g4, @g5], [@g3, @g4, @g5, @g6],
						[@a1, @b1, @c1, @d1], [@b1, @c1, @d1, @e1], [@c1, @d1, @e1, @f1], [@d1, @e1, @f1, @g1],
						[@a2, @b2, @c2, @d2], [@b2, @c2, @d2, @e2], [@c2, @d2, @e2, @f2], [@d2, @e2, @f2, @g2],
						[@a3, @b3, @c3, @d3], [@b3, @c3, @d3, @e3], [@c3, @d3, @e3, @f3], [@d3, @e3, @f3, @g3],
						[@a4, @b4, @c4, @d4], [@b4, @c4, @d4, @e4], [@c4, @d4, @e4, @f4], [@d4, @e4, @f4, @g4],
						[@a5, @b5, @c5, @d5], [@b5, @c5, @d5, @e5], [@c5, @d5, @e5, @f5], [@d5, @e5, @f5, @g5],
						[@a6, @b6, @c6, @d6], [@b6, @c6, @d6, @e6], [@c6, @d6, @e6, @f6], [@d6, @e6, @f6, @g6],
						[@a3, @b4, @c5, @d6], [@a2, @b3, @c4, @d5], [@b3, @c4, @d5, @e6], [@a1, @b2, @c3, @d4], [@b2, @c3, @d4, @e5], [@c3, @d4, @e5, @f6], [@b1, @c2, @d3, @e4], [@c2, @d3, @e4, @f5], [@d3, @e4, @f5, @g6], [@c1, @d2, @e3, @f4], [@d2, @e3, @f4, @g5], [@d1, @e2, @f3, @g4], 
						[@a4, @b3, @c2, @d1], [@a5, @b4, @c3, @d2], [@b4, @c3, @d2, @e1], [@a6, @b5, @b4, @b3], [@b5, @c4, @d3, @e2], [@c4, @d3, @e2, @f1], [@b6, @c5, @d4, @e3], [@c5, @d4, @e3, @f2], [@d4, @e3, @f2, @g1], [@c6, @d5, @e4, @f3], [@d5, @e4, @f3, @g2], [@d6, @e5, @f4, @g3] 
					]
		calculate_connected_nodes
	end

	def calculate_connected_nodes
		@array_of_nodes.each do |node|
			@array_of_4s.each do |combination|
				if combination.include?(node)
					node.combinations << combination
				end
			end
		end
	end


end







