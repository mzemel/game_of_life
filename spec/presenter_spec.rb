describe "Presenter" do
  let(:a) { Cell.alive }
  let(:d) { Cell.dead }

  it "accurately outputs the grid" do
    cells = [
      [a, a, d],
      [a, d, a],
      [d, d, a],
    ]

    grid = Grid.new(3, 3, cells)
    s = Cell.alive.to_s
    expected_print = [
      "🐰 🐰  ",
      "🐰   🐰",
      "    🐰",
    ].join("\n")

    expect { grid.presenter.print_grid }.to output(expected_print).to_stdout
  end
end

