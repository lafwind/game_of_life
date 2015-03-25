class Game

  def initialize(grid)
    @grid = grid

    init_length
    init_result_grid
  end

  def tick
    @y_length.times do |i|
      if alive_y?(i) && has_2_alive_y_neighbors?(i)
        set_alive(i)
      end
    end

    if alive_x?(1) && has_2_alive_x_neighbors?(1)
      @next_tick_grid = [[0, 1, 0]]
    end

    @next_tick_grid
  end

  private

  def init_length
    @x_length = @grid[0].length
    @y_length = @grid.length
  end

  def init_result_grid
    # Array.new(@y_length) { [0] }
    # cool!!!
    @next_tick_grid = @y_length.times.map { [0] * @x_length }
  end

  def alive_y?(i)
    @y_length > 1 && @grid[i][0] == 1
  end

  def alive_x?(j)
    @x_length > 1 && @grid[0][j] == 1
  end

  def set_alive(i)
    @next_tick_grid[i][0] = 1
    @next_tick_grid
  end

  def has_2_alive_y_neighbors?(i)
    up_cell_alive?(i) && down_cell_alive?(i)
  end

  def has_2_alive_x_neighbors?(j)
    @grid[0][j-1] == 1 && @grid[0][j+1] == 1
  end

  def up_cell_alive?(i)
    i > 0 && @grid[i-1][0] == 1
  end

  def down_cell_alive?(i)
    i < @y_length - 1 && @grid[i+1][0] == 1
  end
end
