class Game
  attr_accessor :grids

  def initialize
    self.grids = [Grid.new]
    loop do
      step!
      sleep 1
      system "clear"
    end
  end

  private

  def step!
    grids.last.print
    grid = grids.last.next_grid
    grids << grid
  end
end

