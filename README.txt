This is a simple I/O Caesar shift-cipher and decoder by D.J. Dykes

To run:

    ARGV 1 = your filename
    ARGV 2 = '#' to shift by -OR- 'decrypt' to bring up decryption menus
    
    The program will poop out <yourfilename>output.txt
    
Examples for your convenience:

    ex$ ruby caesar.rb sample.txt 420     # => shift by 420 
    ex$ ruby caesar.rb sample.txt decrypt  # => decrypt this file
