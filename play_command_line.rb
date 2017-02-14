require "./lib/game.rb"

class NilClass
	def to_s
		" "
	end
end

def display_board(board)
	print " " + board.a6.value.to_s + " " + board.b6.value.to_s + " " + board.c6.value.to_s + " " + board.d6.value.to_s + " " + board.e6.value.to_s + " " + board.f6.value.to_s + " " + board.g6.value.to_s
	puts
	print " " + board.a5.value.to_s + " " + board.b5.value.to_s + " " + board.c5.value.to_s + " " + board.d5.value.to_s + " " + board.e5.value.to_s + " " + board.f5.value.to_s + " " + board.g5.value.to_s
	puts
	print " " + board.a4.value.to_s + " " + board.b4.value.to_s + " " + board.c4.value.to_s + " " + board.d4.value.to_s + " " + board.e4.value.to_s + " " + board.f4.value.to_s + " " + board.g4.value.to_s
	puts
	print " " + board.a3.value.to_s + " " + board.b3.value.to_s + " " + board.c3.value.to_s + " " + board.d3.value.to_s + " " + board.e3.value.to_s + " " + board.f3.value.to_s + " " + board.g3.value.to_s
	puts
	print " " + board.a2.value.to_s + " " + board.b2.value.to_s + " " + board.c2.value.to_s + " " + board.d2.value.to_s + " " + board.e2.value.to_s + " " + board.f2.value.to_s + " " + board.g2.value.to_s
	puts
	print " " + board.a1.value.to_s + " " + board.b1.value.to_s + " " + board.c1.value.to_s + " " + board.d1.value.to_s + " " + board.e1.value.to_s + " " + board.f1.value.to_s + " " + board.g1.value.to_s
	puts
	print " " + "a" + " " + "b" + " " + "c" + " " + "d" + " " + "e" + " " + "f" + " " + "g"
	puts
end


puts "Welcome to Connect Four! Please type the name of player 1:"
player1 = gets.chomp
puts "And the name of player 2:"
player2 = gets.chomp
puts "#{player1} will play with \u2618, and #{player2} with \u2620"
sleep 3


game = Game.new(player1, player2)

until game.game_won? || game.game_tied?
	display_board(game.board)
	puts "It's your turn, #{game.active_player.name}. Choose a column! ('a'... 'g')"
	column = gets.chomp
	game.make_play(column)
	game.declare_winner if game.game_won?
	game.change_active_player
end

if game.game_won?
	puts "#{game.winner.name} connected 4. Congratulations!"
	display_board(game.board)
end

if game.game_tied?
	puts "Looks like the game was a tie!"
end
