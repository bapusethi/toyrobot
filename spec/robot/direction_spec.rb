require_relative '../spec_helper'
require_relative '../../lib/robot'
include Robot

describe Direction do
  
  describe ":: finds directions" do
     it { expect( Direction.find "NORTH" ).to be Direction.NORTH }
     it { expect( Direction.find "SOUTH" ).to be Direction.SOUTH }
     it { expect( Direction.find "EAST"  ).to be Direction.EAST  }
     it { expect( Direction.find "WEST"  ).to be Direction.WEST  }
  end
  
  describe ":: turns left" do
     it { expect( Direction.left Direction.NORTH ).to be Direction.WEST }
     it { expect( Direction.left Direction.SOUTH ).to be Direction.EAST }
     it { expect( Direction.left Direction.EAST ).to be Direction.NORTH }
     it { expect( Direction.left Direction.WEST ).to be Direction.SOUTH }
  end
  
  describe ":: turns right" do
     it { expect( Direction.right Direction.NORTH ).to be Direction.EAST }
     it { expect( Direction.right Direction.SOUTH ).to be Direction.WEST }
     it { expect( Direction.right Direction.EAST ).to be Direction.SOUTH }
     it { expect( Direction.right Direction.WEST ).to be Direction.NORTH }
  end
  
end