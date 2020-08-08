dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit","bob"]



def substrings(word, dictionary)
  words_hash = Hash.new
  word.split(" ").each do |string_word|
  
  dictionary.each do |dic_word|
    i = 0
    while i < dic_word.length
    if dic_word.reverse.include?(string_word[0..i].reverse) && (i == (dic_word.length - 1) )
      
       !words_hash[dic_word] ? words_hash[dic_word] = 1 : words_hash[dic_word] += 1 
        # p dic_word
        p words_hash
        end  
        i += 1 
      end
    end
  end
end



substrings("bob partner, sit down! How's it going?", dictionary)
=begin
Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
=end