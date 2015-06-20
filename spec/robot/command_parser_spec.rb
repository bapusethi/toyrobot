require_relative '../spec_helper'
require_relative '../../lib/robot'

include Robot

describe CommandParser do
  
  subject(:command_parser) {CommandParser.new({
                   "Salute" => [
                                 [:string],
                                 ["^Hello$|^Namaste$"]
                                ],
                                
                    "Name" => [
                                 [:string],
                                 []
                              ] ,
                    "Age" => [
                                 [:number],
                                 []
                              ]                      
                                
              })}

  
  context "#with valid command" do  
    
    context "with range" do
      before {
                @ran    = false
                @called = command_parser.parse "Salute Hello" do |m,a|
                  @ran = true
                  @m = m
                  @a = a
                end
      }
      
      it { expect(@ran).to    be true }
      it { expect(@called).to be true }  
      it { expect(@a.size).to be 1    } 
      it { expect(@a[0]).to  match "Hello"  } 
      it { expect(@m).to     match "Salute" }      
    end
    
    
  context "#without range" do   
     
     context "with string" do  
       before {
                @ran    = false
                @called = command_parser.parse "Name Tom" do |m,a|
                  @ran = true
                  @m = m
                  @a = a
                end
               }
           
       it { expect(@ran).to be true    }
       it { expect(@called).to be true }
       it { expect(@a.size).to be 1    } 
       it { expect(@a[0]).to  match "Tom"  } 
       it { expect(@m).to     match "Name" }    
     end
      
     context "with number" do
       before {
                @ran = false
                @called = command_parser.parse "Age 50" do |m,a|
                          @ran    = true
                          @m      = m
                          @a      = a
                end
       }
        
       it { expect(@ran).to    be true }
       it { expect(@called).to be true }
       it { expect(@a.size).to be 1    }   
       it { expect(@a[0]).to   be 50   } 
       it { expect(@m).to     match      "Age"}  
       end
    end    
  end      
  
  
  
  context "#with invalid command" do    
    before {
                @ran = false
                @called = command_parser.parse "Salute Hi" do |m,a|
                  @ran = true
                end 
     }
    
     it { expect(@called).to be false }
     it { expect(@called).to be false }        
    end
    
end 