describe "Cell" do
  it "has a state" do
    expect([Cell.dead, Cell.alive]).to include(Cell.random)
  end
end
