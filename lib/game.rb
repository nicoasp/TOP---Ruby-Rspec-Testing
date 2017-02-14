require "./lib/board.rb"
require "./lib/player.rb"

class Game

	attr_reader :board, :winner, :player1, :player2, :last_played_node, :active_player

	def initialize(player1_name = "player1", player2_name = "player2", player1_mark = "\u2618", player2_mark = "\u2620")
		@board = Board.new
		@winner = nil
		@player1 = Player.new(player1_name, player1_mark)
		@player2 = Player.new(player2_name, player2_mark)
		@active_player = @player1
		@last_played_node = nil
	end

	def make_play(column)
		@last_played_node = @board.array_of_nodes.select do |node|
			node.column == column && node.value == nil
		end.first
		begin
			@last_played_node.value = @active_player.mark
		rescue
			puts "That's not a valid column!"
		end
	end

	def game_won?
		if @last_played_node == nil
			return false
		end
		@last_played_node.combinations.each do |combination|
			if (combination[0].value != nil)
				if combination[0].value == combination[1].value && combination[0].value == combination[2].value && combination[0].value == combination[3].value
					return true
				end
			end
		end
		false
	end

	def declare_winner
		@winner = @active_player
	end

	def game_tied?
		return false if game_won?
		@board.array_of_nodes.each do |node|
			return false if node.value == nil
		end
		true		
	end

	def change_active_player
		if @active_player == @player1
			@active_player = @player2
		else
			@active_player = @player1
		end
	end

end
