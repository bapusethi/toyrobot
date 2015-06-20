module Robot
  class ToyRobot
    attr_accessor :position, :placed
    
    def initialize
      @position  = nil
      @placed    = false
      $logger.info "Toy Robot created successfully."
    end
    
    def to_s
      if @placed 
       "Placed at #{@position.to_s}"
      else  
      "Not placed"
      end
    end
    
  end
end