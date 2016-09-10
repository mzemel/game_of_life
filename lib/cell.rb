class Cell
  attr_accessor :state

  ALIVE = :alive
  DEAD = :dead

  def initialize(state = nil)
    @state = state || set_random_state
  end

  def self.alive
    Cell.new(ALIVE)
  end

  def self.dead
    Cell.new(DEAD)
  end

  def ==(other)
    state == other.state
  end

  def alive?
    self == Cell.alive
  end

  def dead?
    self == Cell.dead
  end

  private

  def set_random_state
    [0,1].sample.zero? ? ALIVE : DEAD
  end
end
