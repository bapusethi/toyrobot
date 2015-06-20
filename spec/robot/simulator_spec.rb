require_relative '../spec_helper'
require_relative '../../lib/robot'
include Robot

describe Simulator do
  
  describe "#gets placed" do
    before {
      @simulator = Simulator.new 5,5
      @simulator.place 2, 3, "NORTH"
    }
    
    it { expect(@simulator.toy_robot.position).to be Position.new(2,3,Direction.NORTH) }
    
  end
  
  describe "#moves" do
    
    context "when inside table" do
      before {
        @simulator = Simulator.new 5,5
        @simulator.place 2, 3, "NORTH"
        @simulator.move
      }
      it { expect(@simulator.toy_robot.position).to be Position.new(2,4,Direction.NORTH) }
    end
    
    context "when at edge of table" do
      before {
        @simulator = Simulator.new 5,5
        @simulator.place 4, 4, "NORTH"
        @simulator.move
      }
      it { expect(@simulator.toy_robot.position).to be Position.new(4,4,Direction.NORTH) }
    end
      
  end
  
  describe "# turns" do
  
    context "when faced north" do
      before {
          @simulator = Simulator.new 5,5
          @simulator.place 2, 2, "NORTH"       
      }
      
      it { @simulator.left  ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.WEST) }
      it { @simulator.right ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.EAST) }
     end
      
     context "when faced south" do
      before {
          @simulator = Simulator.new 5,5
          @simulator.place 2, 2, "SOUTH"       
      }
      
      it { @simulator.left  ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.EAST) }
      it { @simulator.right ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.WEST) }
     end 
      
     context "when faced east" do
      before {
          @simulator = Simulator.new 5,5
          @simulator.place 2, 2, "EAST"       
      }
      
      it { @simulator.left  ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.NORTH) }
      it { @simulator.right ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.SOUTH) }
     end  
     
     context "when faced west" do
      before {
          @simulator = Simulator.new 5,5
          @simulator.place 2, 2, "WEST"       
      }
      
      it { @simulator.left  ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.SOUTH) }
      it { @simulator.right ; expect(@simulator.toy_robot.position).to be Position.new(2,2,Direction.NORTH) }
     end  
    
  end
  
end