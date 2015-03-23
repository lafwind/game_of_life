class Game

  def initialize(grid)
    @grid = grid
    @grid_length = grid.length

    init_grid
  end

  def tick
    @grid_length.times do |i|
      if alive?(i) && has_2_alive_neighbors?(i)
        set_alive(i)
      end
    end

    @next_tick_grid
  end

  private

  def init_grid
    # Array.new(@grid_length) { [0] }
    @next_tick_grid = @grid_length.times.map { [0] }
  end

  def alive?(i)
    @grid_length > 1 && @grid[i][0] == 1
  end

  def set_alive(i)
    @next_tick_grid[i][0] = 1
    @next_tick_grid
  end

  def has_2_alive_neighbors?(i)
    up_cell_alive?(i) && down_cell_alive?(i)
  end

  def up_cell_alive?(i)
    i > 0 && @grid[i-1][0] == 1
  end

  def down_cell_alive?(i)
    i < @grid_length - 1 && @grid[i+1][0] == 1
  end
end
