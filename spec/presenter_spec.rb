describe "Presenter" do
  it "accurately outputs the grid" do
    cells = {
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

    grid = Grid.new(3, 3, cells)
    expect { grid.presenter.print }.to output("•• \n•• \n•• \n").to_stdout
  end
end

