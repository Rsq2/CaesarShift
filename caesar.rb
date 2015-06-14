class Caesar
  def initialize
    @text_in = open(ARGV.first)
    #@shift = ARGV.second
  end

  def cyghfer(shift)    
    output = []

    # Generate Dictionary
    letters = ('a'..'z').to_a 
    caps = ('A'..'Z').to_a

    @text_in.each_char do |b|   
      if letters.include?(b)
        output << letters[ wrap( letters.index(b) + shift ) ]
      elsif caps.include?(b)
        output << caps[ wrap( caps.index(b) + shift ) ]
      else 
        output << b
      end    
    end

    # Visual Output
    puts '=' * 69
      puts '100% ULTRA TOP SECERET CODED MESSAGE #2015 #EXTRAVAGANZA'    
    puts '=' * 69
    puts output.join + "[ #{shift} ]"
    puts ' '
  end

# NOTE: Super-mega interesting: While Ruby does interpret negative calls on indices to originate from the END of the array, it doesn't wrap around if the call is greater than +/- the total number of entries. So, to keep the text safe from having NIL values injected into it by large shifts, here is a wrapping algorithm to wrangle those integers back into their box.
  def wrap(x)  
    range = 26
    if (x < 0)
      x += range * ((0 - x) / range + 1)    
    end
    x = (x % range)
  end
end

start = Caesar.new
#start.cyghfer(0)
#start.cyghfer(1)
#start.cyghfer(-1)
#start.cyghfer(26)
#start.cyghfer(-26)
start.cyghfer(999999999)
