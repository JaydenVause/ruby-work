def factorial(n)
  # break case
  if n == 1 
    return 1
  else
    n*factorial(n-1)
  end
end

print factorial(5)

racecar

def pelindrome(string)
  puts  string
  if string.length <= 1
    return true
  else
    if string[0] == string[-1]
      pelindrome(string[1..-2])
    else
      return false
    end
  end
end

p pelindrome('racecar')


def bottles_of_beer(n)
  return if n < 0
  puts "#{n} bottles of beer on the wall"
  return bottles_of_beer(n-1)
end

bottles_of_beer 10 

Define a recursive function that takes an argument n and returns the fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.

fib number = n-2 + n-1

def fib_rec(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib_rec(n-2) + fib_rec(n-1)
end

p fib_rec 5

Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def flat(array, new_array=[])
  # closing statement
  array.each do |item|
    if !item.is_a?(Array)
      new_array << item
    else
      flat(item, new_array)
    end
  end
  return new_array
end


p flat [[1, [8, 9]], [3, 4]]






Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.

def roman_num(n, string = "")
roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}
return if n == 0
roman_mapping.each do |k,v|
  if n - k >= 0
    string.concat(v)
    n -= k
    roman_num(n, string)
  end
end
return string
end


print roman_num(3)
Use the roman_mapping hash to define a recursive method that converts a Roman numeral to an integer.

 
def convert_roman(string,value=0)
  roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}
  puts value if string.length == 0
  roman_mapping.each do |k, v|
    if string[0..k.length-1] == k
      value += v
      string.slice!(0..k.length-1)
      convert_roman(string, value)
    end
  end

end

convert_roman("MCM")
