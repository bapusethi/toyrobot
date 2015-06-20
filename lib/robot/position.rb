module Robot
  class Position
    
    attr_accessor :x, :y, :direction
    
    def initialize(x,y,direction)
      @x = x
      @y = y
      @direction = direction
    end
    
    def to_s
      "X= #{@x} Y=#{@y} Facing=#{@direction.to_s}"
    end
    
     def equal?(another_position)
      self.x == another_position.x &&
      self.y == another_position.y &&
      self.direction == another_position.direction
     end
    
    def move      
       curr_postion   = self.dup
       case curr_postion.direction
         when Direction.NORTH
           curr_postion.y +=1   
         when Direction.SOUTH
           curr_postion.y -=1 
         when Direction.EAST
           curr_postion.x +=1 
         when Direction.WEST
           curr_postion.x -=1   
       end
       curr_postion
    end
    
    def left
      curr_postion   = self.dup
      curr_postion.direction = Direction.left @direction
      curr_postion
    end
    
    def right
      curr_postion   = self.dup
      curr_postion.direction = Direction.right @direction
      curr_postion
    end
    
  end
end