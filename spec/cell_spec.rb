describe "Cell" do
	let(:cell) { Cell.new }
	it "has a state" do
		expect(['alive', 'dead']).to include(cell.state)
	end

	it "can have the state set" do
		_cell = Cell.new('alive')
		expect(cell.state).to eq('alive')
	end
end