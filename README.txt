This is a simple Caesar shift encoder/decoder by D.J. Dykes

To run:

    ARGV 1 = your filename
    ARGV 2 = '#' to shift by -OR- 'decrypt' to bring up decryption menus
    
    The program will pop out <yourfilename>-output.txt
    
Examples for your convenience:

    ex$ ruby caesar.rb sample.txt 24     # => shift by 24
    ex$ ruby caesar.rb sample.txt decrypt  # => decrypt this file
