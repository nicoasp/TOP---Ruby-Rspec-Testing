require "board"

describe Board do
	context "when initialized" do
		it "has empty node on each position" do
			expect(subject.a1).to be_a Node
			expect(subject.a2).to be_a Node
			expect(subject.a3).to be_a Node
			expect(subject.a4).to be_a Node
			expect(subject.a5).to be_a Node
			expect(subject.a6).to be_a Node
			expect(subject.b1).to be_a Node
			expect(subject.b2).to be_a Node
			expect(subject.b3).to be_a Node
			expect(subject.b4).to be_a Node
			expect(subject.b5).to be_a Node
			expect(subject.b6).to be_a Node
			expect(subject.c1).to be_a Node
			expect(subject.c2).to be_a Node
			expect(subject.c3).to be_a Node
			expect(subject.c4).to be_a Node
			expect(subject.c5).to be_a Node
			expect(subject.c6).to be_a Node
			expect(subject.d1).to be_a Node
			expect(subject.d2).to be_a Node
			expect(subject.d3).to be_a Node
			expect(subject.d4).to be_a Node
			expect(subject.d5).to be_a Node
			expect(subject.d6).to be_a Node
			expect(subject.e1).to be_a Node
			expect(subject.e2).to be_a Node
			expect(subject.e3).to be_a Node
			expect(subject.e4).to be_a Node
			expect(subject.e5).to be_a Node
			expect(subject.e6).to be_a Node
			expect(subject.f1).to be_a Node
			expect(subject.f2).to be_a Node
			expect(subject.f3).to be_a Node
			expect(subject.f4).to be_a Node
			expect(subject.f5).to be_a Node
			expect(subject.f6).to be_a Node
			expect(subject.g1).to be_a Node
			expect(subject.g2).to be_a Node
			expect(subject.g3).to be_a Node
			expect(subject.g4).to be_a Node
			expect(subject.g5).to be_a Node
			expect(subject.g6).to be_a Node
		end

		describe "@array_of_nodes" do
			it "has 42 elements" do
				expect(subject.array_of_nodes.size).to eql(42)
			end
		end

		describe "@array_of_4s" do
			it "has 69 combinations" do
				expect(subject.array_of_4s.size).to eql(69)
			end
			it "contains combinations of 4 connected nodes" do
				expect(subject.array_of_4s).to include([subject.a1, subject.a2, subject.a3, subject.a4])
				expect(subject.array_of_4s).to include([subject.b3, subject.c3, subject.d3, subject.e3])
				expect(subject.array_of_4s).to include([subject.c6, subject.d5, subject.e4, subject.f3])
			end
		end

		context "it calls .calculate_connected_nodes" do
			it "nodes include all their combinations" do
				expect(subject.a1.combinations).to include([subject.a1, subject.a2, subject.a3, subject.a4])
				expect(subject.f3.combinations).to include([subject.d3, subject.e3, subject.f3, subject.g3])
				expect(subject.g6.combinations).to include([subject.g3, subject.g4, subject.g5, subject.g6])
				expect(subject.b4.combinations).to include([subject.a5, subject.b4, subject.c3, subject.d2])
				expect(subject.d2.combinations).to include([subject.c1, subject.d2, subject.e3, subject.f4])
			end
		end
	end

	describe ".calculate connected nodes" do
		before do
			subject.calculate_connected_nodes
		end

		it "nodes include all their combinations" do
			expect(subject.a1.combinations).to include([subject.a1, subject.a2, subject.a3, subject.a4])
			expect(subject.f3.combinations).to include([subject.d3, subject.e3, subject.f3, subject.g3])
			expect(subject.g6.combinations).to include([subject.g3, subject.g4, subject.g5, subject.g6])
			expect(subject.b4.combinations).to include([subject.a5, subject.b4, subject.c3, subject.d2])
			expect(subject.d2.combinations).to include([subject.c1, subject.d2, subject.e3, subject.f4])
		end
	end
end









