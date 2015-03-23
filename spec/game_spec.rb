require 'spec_helper'

def assert_grid(init_grid)
  game = Game.new init_grid
  game.tick.should == [[0]]
end
describe Game do

  context "only one cell" do
    it "dead cell will still be dead" do
      assert_grid [[0]]
    end

    it "alive cell will die" do
      assert_grid [[1]]
    end
  end

end
