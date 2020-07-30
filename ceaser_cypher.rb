puts "Hi user welcome to the ceaser cypher encryption program."
print "To start give me a string to encrypt:"
string = gets.chomp
print "great! Now give us a key value to encrypt your message eg. 10 or -10 "
key = gets.chomp.to_i


def ceaser_cypher(string, key)
    #cypher alphabet/numeric arrays
    array = string.split("")
    
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
            "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    
      #cypher slice functions if function requires items - or + what the array provides
    if key > 0
        new_alpha = alphabet+alphabet.slice(0, key)
        new_num = numbers+numbers.slice(0, key)
    else
        i = 0
        z = 0
        while i > key do
            z += 1
            i -= 1
            sliced_alpha = alphabet.reverse.slice(0,z)
            sliced_num = numbers.reverse.slice(0,z)  
        end
        new_alpha = sliced_alpha.reverse + new_alpha
        new_num = sliced_num.reverse + new_num
    end   
    
    print "the message is : "
    #loops to determine what the strings are and how to split it from num/alpha/or char
    for letter in array                  
        if numbers.include?(letter)
           i = 0
            while i < new_num.length do
                if new_num[i] == letter
                    print new_num[i+key]
                end
                i += 1
            end
        elsif !new_alpha.include?(letter) && new_alpha.include?(letter.downcase)
                i = 0
                while i < new_alpha.length do
                    if new_alpha[i] == letter.downcase
                        print new_alpha[i+key].upcase
                    end
                    i += 1
                end
        elsif  new_alpha.include?(letter.downcase)           
            i = 0
            while i < new_alpha.length do
                if new_alpha[i] == letter
                    print new_alpha[i+key]
                end
                i += 1
            end
        else
            print letter
        end
    end
end
#controlling user input on the terms they give a valid input or not
if string.length <= 0 
    puts "error"
else
    ceaser_cypher(string, key)
end


