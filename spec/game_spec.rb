require "game"

describe Game do
	context "when initialized" do
		it "contains a board" do
			expect(subject.board).to be_a Board
		end
		it {is_expected.to respond_to(:winner)}
		it "has 2 players" do
			expect(subject.player1).to be_a Player
			expect(subject.player2).to be_a Player
		end
		it "active_player is player1" do
			expect(subject.active_player).to equal(subject.player1)
		end
		it "last played node is nil" do
			expect(subject.last_played_node).to be_nil
		end
	end

	describe "#make_play" do
		before do
			3.times {subject.make_play("c")}
		end

		it "assigns values to node at the bottom" do
			expect(subject.board.c1.value).to eql(subject.active_player.mark)
			expect(subject.board.c2.value).to eql(subject.active_player.mark)
			expect(subject.board.c3.value).to eql(subject.active_player.mark)
		end

		context "if a column is full" do
			before do
				3.times {subject.make_play("c")}
			end
			it "top row contains value" do
				expect(subject.board.c6.value).to eql(subject.active_player.mark)
			end
			context "when placing new play on column" do
				before do
					subject.change_active_player
					subject.make_play("c")
					subject.change_active_player
				end
				it "gets rescued" do
					expect(subject.board.c6.value).to eql(subject.active_player.mark)
				end
			end
		end
	end

	describe "#game_won?" do
		context "when not connected 4" do
			it "returns false" do
				expect(subject.game_won?).to eql(false)
			end
		end
		context "when connected 4" do
			before do
				4.times {subject.make_play("c")}
			end				
			it "returns true" do
				expect(subject.game_won?).to eql(true)
			end
		end
	end

	describe "#game_tied" do
		context "when still squares to play" do
			it "returns false" do
				expect(subject.game_tied?).to eql(false)
			end
		end
		context "when all squares played and not won" do
			before do
				subject.board.array_of_nodes.each do |node|
					node.value = rand
				end
			end
			it "returns true" do
				expect(subject.game_tied?).to eql(true)
			end
		end
	end


	describe "#change_active_player" do
		context "before calling it" do
			it "active_player is player1" do
				expect(subject.active_player).to equal(subject.player1)
			end
		end
		context "after calling it" do
			before do
				subject.change_active_player
			end
			it "active_player is player2" do
				expect(subject.active_player).to equal(subject.player2)
			end
		end
	end




end