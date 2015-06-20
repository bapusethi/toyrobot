require_relative '../spec_helper'
require_relative '../../lib/robot'
include Robot

describe Position do
  
  context "#moves correctly to north" do
    before {
      @position      = Position.new(2, 3, Direction.NORTH)
      @curr_position = @position.move
    }
    
    it { expect(@curr_position.x).to be 2 }
    it { expect(@curr_position.y).to be 4 }
    it { expect(@curr_position.direction).to be Direction.NORTH }
    
  end
  
  context "#moves correctly to south" do
    before {
      @position      = Position.new(2, 3, Direction.SOUTH)
      @curr_position = @position.move
    }
    
    it { expect(@curr_position.x).to be 2 }
    it { expect(@curr_position.y).to be 2 }
    it { expect(@curr_position.direction).to be Direction.SOUTH }
    
  end
  
  context "#moves correctly to east" do
    before {
      @position      = Position.new(2, 3, Direction.EAST)
      @curr_position = @position.move
    }
    
    it { expect(@curr_position.x).to be 3 }
    it { expect(@curr_position.y).to be 3 }
    it { expect(@curr_position.direction).to be Direction.EAST }
    
  end
  
  context "#moves correctly to west" do
    before {
      @position      = Position.new(2, 3, Direction.WEST)
      @curr_position = @position.move
    }
    
    it { expect(@curr_position.x).to be 1 }
    it { expect(@curr_position.y).to be 3 }
    it { expect(@curr_position.direction).to be Direction.WEST }
    
  end
  
  context "#turns left" do
    before {
      start_position  = Position.new(2, 3, Direction.WEST)
      @position  = start_position.left
    }
    
    it { expect(@position.x).to be 2 }
    it { expect(@position.y).to be 3 }
    it { expect(@position.direction).to be Direction.SOUTH }
  end
  
  context "#turns right" do
    before {
      start_position  = Position.new(2, 3, Direction.WEST)
      @position       = start_position.right
    }
    
    it { expect(@position.x).to be 2 }
    it { expect(@position.y).to be 3 }
    it { expect(@position.direction).to be Direction.NORTH }
  end
  
end