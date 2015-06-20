module Robot
  class Direction
	  
	  attr_accessor :direction
	  
    def initialize(direction)
      @direction = direction
    end
   
    @NORTH = Direction.new "NORTH"
    @SOUTH = Direction.new "SOUTH"
    @EAST  = Direction.new "EAST"
    @WEST  = Direction.new "WEST"
     
    @CLOCKWISE_DIRECTIONS = [@NORTH,@EAST,@SOUTH,@WEST]
   
    def to_s
      @direction
    end
   
    class << self
      attr_accessor :NORTH, :SOUTH, :EAST, :WEST  
    end
   
    def self.find(direction)
      @CLOCKWISE_DIRECTIONS.find{|d| d.direction == direction.upcase }
    end
   
    def self.left(direction)
      @CLOCKWISE_DIRECTIONS[( @CLOCKWISE_DIRECTIONS.index(direction) - 1 ) % 4]  
    end
   
    def self.right(direction)
      @CLOCKWISE_DIRECTIONS[( @CLOCKWISE_DIRECTIONS.index(direction) + 1 ) % 4]  
    end
         
 end
end
