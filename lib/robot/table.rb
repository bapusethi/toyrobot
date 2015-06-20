module Robot
  class Table    
     
     def initialize max_x , max_y
        @MAX_X = max_x
        @MAX_Y = max_y
        $logger.info "Table boundaries are #{@MAX_X},#{@MAX_Y}"
     end
     
     def inside? x,y
       return ((0..@MAX_X-1) === x) && ((0..@MAX_Y-1) === y) 
     end
     
  end
end