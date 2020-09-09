def ceaser_cypher(string, key)
    #cypher alphabet/numeric arrays
    array = string.split("")
    
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
            "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    new_alpha = alphabet
    new_num = numbers
    alpha_array_ext = [] 
    num_array_ext = [] 
    result = String.new
      #cypher slice functions if function requires items - or + what the array provides
    if key > 0
        i = 0
        while i < key do
            i += 1
            alphabet.push(alphabet[i-1])
            numbers.push(numbers[i-1])
        end 
     else
        i = 0
        while i > key do
            i -= 1
            x = alphabet.length + i
            y = numbers.length + i

            alphabet.unshift(alphabet[i])
            numbers.unshift(numbers[i])
        end 
    end   
   
    print "the message is : "
    #loops to determine what the strings are and how to split it from num/alpha/or char
    for letter in array                  
        if numbers.include?(letter)
           i = 0
            while i < numbers.length do
                if numbers[i] == letter
                    result.concat(numbers[i+key].to_s)
                end
                i += 1
            end
        elsif !alphabet.include?(letter) && alphabet.include?(letter.downcase)
                i = 0
                while i < alphabet.length do
                    if alphabet[i] == letter.downcase
                        result.concat(alphabet[i+key].to_s.upcase)
                    end
                    i += 1
                end
        elsif  alphabet.include?(letter.downcase)           
            i = 0
            while i < alphabet.length do
                if alphabet[i] == letter
                    result.concat(alphabet[i+key].to_s)
                end
                i += 1
            end
        else
            result.concat(letter)
        end
    end
    return result
 end