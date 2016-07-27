describe "Grid" do
	context "cells" do
		let(:cells) do
			{
				0 => {
					0 => Cell.new('alive'), 1 => Cell.new('alive'), 2 => Cell.new('dead')
				},
				1 => {
					0 => Cell.new('alive'), 1 => Cell.new('alive'), 2 => Cell.new('dead')
				},
				2 => {
					0 => Cell.new('alive'), 1 => Cell.new('alive'), 2 => Cell.new('dead')
				}
			}
		end
		let(:grid) { Grid.new(3, 3, cells) }

		it "can be supplied" do
			expect(grid.cells).to eq(cells)
		end

		it "knows if an overpopulated cell survives" do
			expect(grid.survives?(cells[1][1], 1, 1)).to eq(false)
		end

		it "knows if an appropriately populated cell survives" do
			expect(grid.survives?(cells[2][1], 2, 1)).to eq(true)
		end

		xit "generates the correct next grid" do
			cells = grid.next_grid.cells
			states = cells.map do |row|
				# (╯°□°）╯︵ ┻━┻)
			end
		end

	end
end
