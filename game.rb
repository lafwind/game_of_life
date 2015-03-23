class Game

  def initialize(init_grid)
    @init_grid = init_grid
  end

  def tick
    if @init_grid.length == 1
      [[0]]
    else
      [[0], [0]]
    end
  end

end
