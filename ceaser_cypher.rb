puts "Hi user welcome to the ceaser cypher encryption program."
print "To start give me a string to encrypt:"
string = gets.chomp
print "great! Now give us a key value to encrypt your message eg. 10 or -10 "
key = gets.chomp.to_i


def ceaser_cypher(string, key)
    #cypher alphabet/numeric arrays
    array = string.split("")
     
    alphabet = ('a'..'z').to_a

    numbers = ('0'..'9').to_a
    
      #cypher slice functions if function requires items - or + what the array provides
    if key > 0
       alphabet.concat(alphabet*key)
       numbers.concat(alphabet*key)
    else
        alphabet.unshift((alphabet.reverse)*(key*key))
        numbers.unshift((numbers.reverse)*(key*key))
    end   
    
 
end

#controlling user input on the terms they give a valid input or not
 string.length <= 0 ? p "error" end : ceaser_cypher(string, key) 



