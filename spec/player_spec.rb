require "player"

describe Player do
	subject do
		Player.new("Nicolas", "red")
	end

	it {is_expected.to respond_to(:name)}
	it {is_expected.to respond_to(:mark)}
end