require 'spec_helper'

def assert_grid(init_grid, expected_grid)
  game = Game.new init_grid
  game.tick.should == expected_grid
end

describe Game do

  context "axis Y" do
    it "1 cell" do
      assert_grid [[0]], [[0]]
      assert_grid [[1]], [[0]]
    end

    it "2 cells" do
      assert_grid [[0], [0]],
                  [[0], [0]]
      assert_grid [[1], [0]],
                  [[0], [0]]
      assert_grid [[0], [1]],
                  [[0], [0]]
      assert_grid [[1], [1]],
                  [[0], [0]]
    end

    context "3 cells" do
      it "all dead" do
        assert_grid [[0], [0], [0]],
                    [[0], [0], [0]]
        assert_grid [[1], [0], [0]],
                    [[0], [0], [0]]
        assert_grid [[1], [1], [0]],
                    [[0], [0], [0]]
      end
      it "keep alive" do
        assert_grid [[1], [1], [1]],
                    [[0], [1], [0]]
      end
    end

    it ">= 4 cells" do
      assert_grid [[0], [0], [0], [0]],
                  [[0], [0], [0], [0]]
      assert_grid [[1], [0], [0], [0]],
                  [[0], [0], [0], [0]]
      assert_grid [[1], [1], [0], [0]],
                  [[0], [0], [0], [0]]
      assert_grid [[1], [0], [1], [0]],
                  [[0], [0], [0], [0]]
      assert_grid [[1], [1], [1], [0]],
                  [[0], [1], [0], [0]]
      assert_grid [[0], [1], [1], [1]],
                  [[0], [0], [1], [0]]
      assert_grid [[1], [1], [1], [1]],
                  [[0], [1], [1], [0]]

      assert_grid [[1], [1], [1], [1], [1]],
                  [[0], [1], [1], [1], [0]]
    end
  end

  context "axis X" do
    it "2 cells" do
      assert_grid [[0, 0]],
                  [[0, 0]]
      assert_grid [[1, 0]],
                  [[0, 0]]
      assert_grid [[1, 1]],
                  [[0, 0]]
    end

    context "3 cell" do
      it "all dead" do
        assert_grid [[0, 0, 0]],
          [[0, 0, 0]]
        assert_grid [[1, 0, 0]],
          [[0, 0, 0]]
        assert_grid [[1, 1, 0]],
          [[0, 0, 0]]
      end

      it "keep alive" do
        assert_grid [[1, 1, 1]],
          [[0, 1, 0]]
      end
    end

    it "4 cells" do
      assert_grid [[0, 0, 0, 0]],
                  [[0, 0, 0, 0]]
      assert_grid [[1, 0, 0, 0]],
                  [[0, 0, 0, 0]]
      assert_grid [[1, 1, 0, 0]],
                  [[0, 0, 0, 0]]
      assert_grid [[1, 1, 1, 0]],
                  [[0, 1, 0, 0]]
      assert_grid [[0, 1, 1, 1]],
                  [[0, 0, 1, 0]]
      assert_grid [[1, 1, 1, 1]],
                  [[0, 1, 1, 0]]
    end
  end

end
