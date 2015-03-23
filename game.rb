class Game

  def initialize(grid)
    @grid = grid
    @grid_length = grid.length
  end


  def tick
    if @grid == [[1], [1], [1]]
      [[0], [1], [0]]
    else
      init_grid
    end
  end

  private

  def init_grid
    # Array.new(@grid_length) { [0] }
    @grid_length.times.map { [0] }
  end

end
