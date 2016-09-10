describe "Grid" do
  context "cells" do
    let(:a) { Cell.alive }
    let(:d) { Cell.dead }
    let(:cells) do
      [
        [a, a, d],
        [a, a, d],
        [a, a, d],
      ]
    end
    let(:grid) { Grid.new(3, 3, cells) }

    it "can be supplied" do
      expect(grid.cells).to eq(cells)
    end

    it "generates the correct next grid" do
      cells = grid.next_grid.cells
      expect(cells).to eq([
        [a, a, d],
        [d, d, a],
        [a, a, d],
      ])
    end

  end
end
