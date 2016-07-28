class Cell
  attr_accessor :state

  def initialize(state = nil)
    @state = state || set_random_state
  end

  def alive?
    state == 'alive'
  end

  def dead?
    state == 'dead'
  end

  private

  def set_random_state
    [0,1].sample.zero? ? 'alive' : 'dead'
  end
end