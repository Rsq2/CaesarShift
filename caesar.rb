class Caesar
  def initialize
    @text_in = open(ARGV.first)

    letters = ('a'..'z').to_a 
    caps = ('A'..'Z').to_a

    @refhash = Hash[letters.map.with_index.to_a + caps.map.with_index.to_a]
  end

  def cyghfer(shift)
    
    output = []

    @text_in.each_char do |b| 
      if @refhash.has_key?(b)
        output << @refhash.key(@refhash[b] + shift)  #all lookups fail returnin nil 
      else 
        output << b
      end    
    end
    puts @refhash
    puts '=' * 50
      puts '100% ULTRA TOP SECERET CODED MESSAGE #2015 #EXTRAVAGA:NZA'    
    puts '=' * 50
    print output.join + "[ #{shift} ]"
    puts ' '
  end

  #def wrap(x) # NOTE: Ruby does this natively with arrays
    #range = 26
    #if (x < 0)
        #x += range * ((0 - val) / range + 1)
    #return 0 + (x % range)
    #end
  #end
end

start = Caesar.new
start.cyghfer(-420)
