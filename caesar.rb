class Caesar

  def initialize
    ## Think about error handling for bad arguments
    @text_in = open(ARGV[0])
    if ARGV[1] == 'decrypt'
      puts "Enter decryption key or type 'brute' to employ brutus force"
      ans = $stdin.gets.chomp
      if ans == 'brute' # enter brute force
        puts "\n et tu...? \n"
        brutus()
      else
        cyghfer(ans.to_i * -1) # proceed with decrypt in the opposite direction 
      end 
    else # proceed with encrypt
      cyghfer(ARGV[1].to_i) 
    end
  end

  # Cipher Algorithm
  def cyghfer(shift)    
    output = []
    # Generate Dictionary
    letters = ('a'..'z').to_a 
    caps = ('A'..'Z').to_a
    # Shift
    @text_in.each_char do |b|   
      if letters.include?(b)
        ## This is inefficient, as you have to traverse the list once for include?
        ## and then again for index().
        ## Can you resuse information? Can you avoid traversing a list at all?
        output << letters[ wrap( letters.index(b) + shift ) ]
      elsif caps.include?(b)
        ## See above ^^
        output << caps[ wrap( caps.index(b) + shift ) ]
      else 
        output << b
      end    
    end
    # Visual Output
    puts ' '
    puts '=' * 69 ## :-O
    puts '100% ULTRA TOP SECERET CODED MESSAGE #2015 #EXTRAVAGANZA #YOLO #BERNIE16'    
    puts '=' * 69
    puts output.join + "[ #{shift} ]"
    ## Might as well add an optional argument for output filename?
    ## Instead of computing the same string twice on subsequent lines, put the filename in a variable anyway.
    File.open("#{ARGV[0]}-output.txt", "w") {|f| f.write(output.join)}
    puts "written to #{ARGV[0]}-output.txt"
  end 
  
  # Brute Force
  def brutus()
    isdone = false 
    newshift = 1
    while isdone == false
      cyghfer(1)
      puts "Are we there yet? [y/n] \n"
      answer = $stdin.gets.chomp.to_s
      ## What happens with bad input?
      if answer == 'y'
        puts "\nEXCELSIOR!!!!\n"
        isdone = true
      else answer == 'n'
        puts "Let's try again..."
        @text_in = open("#{ARGV[0]}-output.txt")
      end
    end
  end 

# NOTE: Super-mega interesting: While Ruby does interpret negative calls on indices
# to originate from the END of the array, it doesn't wrap around if the call is 
# greater than +/- the total number of entries. So, to keep the text safe from having
# NIL values injected into it by large shifts, here is a wrapping algorithm to wrangle
# those integers back into their box.
  
  def wrap(x)  
    range = 26
    if (x < 0)
       ## Order of operations is not immediately clear -- is it (-x/range) + 1 OR -x/(range + 1)?
      x += range * ((0 - x) / range + 1)
    end
    ## Explain in the comment why you have to have the block above before this line?
    x = (x % range)
  end
end
 
start = Caesar.new
