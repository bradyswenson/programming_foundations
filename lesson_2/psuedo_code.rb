=begin
  
For example, write out pseudo-code (both casual and formal) that does the following:

1. a method that returns the sum of two integers
2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
3. a method that takes an array of integers, and returns a new array with every other element
 
-------------------------


1. 

take two integer inputs
multiply one integer by the other

START

SET result = sum of integer1 and integer2
PRINT results

END

2. 

method takes array of strings
iterate over array to concatenate each item in array into one string
return that string


START

SET result = [] 
SET iterator = 0
WHILE iterator < strings.length
  result .= strings[iterator]

END

3. 

method takes array of integers
iterate over array to create new array with every other element of original array
return new array with every other element

START 

GET some number of integers
SET integers = []
SET every_other = []
SET iterator = 0
WHILE iterator < integers.length
  IF iterator is even
    integers(iterator).push(every_other)
END



=end

