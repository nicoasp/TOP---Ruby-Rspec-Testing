require "node"

describe Node do
	context "when initialized" do
		subject do
			Node.new("c", 4)
		end
			it "has value nil" do
				expect(subject.value).to be_nil
			end
			it {is_expected.to respond_to(:combinations)}
			it "has column 'c'" do
				expect(subject.column).to eql("c")
			end
			it "has row '4'" do
				expect(subject.row).to eql(4)
			end
	end
	context "when occupied" do 
		subject do
			Node.new("c", 4)
		end
		before do
			subject.value = "red"
		end
		it "has a value" do
			expect(subject.value).to eql("red")
		end
	end




end
