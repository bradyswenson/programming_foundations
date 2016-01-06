puts 'Question 1:'

(1..10).each { |num| puts (' ' * num) + 'The Flintstones Rock!' }

puts 'Question 2:'

statement = 'The Flintstones Rock'
# get through each char
#

def letter_count(str)
  counts = {}

  str.each_char do |char|
    next if char == " "
    counts[char] = 0 unless counts.include?(char)
    counts[char] += 1
  end

  counts
end

puts letter_count(statement)

puts 'Question 3:'

# The error will occur because you cannot mix string concatenation
# and math addition versions of the + operator. It can be done like this:

puts 'the value of 40 + 2 is ' + (40 + 2).to_s

# or

puts "the value of 40 + 2 is #{40 + 2}"

# Question 4:
#
# returns 1, 3 [3,4]
#
# returns 1, 2 [1, 2]
#
# the arrays are being shifted and popped while looping, the loop is then based
# on the changing array, leads to perhaps unexpected behavior
#

# Question 5:

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

#
# number % dividend == 0 let's us know if there is no remainder
#
# this returns the divisors from the method to the caller
#

# Question 6
#
# there is a difference, the + operater concatenates and returns a new array
# << pushes new_element to the end of the original array
#
# the first does not mutate the caller, the second does
#


puts 'Question 7:'

#
# the limit var is declared outside the method and is not available inside
# the method
#
# make the limit a passed in var and set a default to fix:

def fib(first_num, second_num, limit = 15)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

puts 'Question 8:'

def titleize!(str)
  str.split.each { |word| word.capitalize! }.join(' ')
end

puts titleize!('titleize this string please')


puts 'Question 9:'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def add_age_group(group)
  group.each do |member, info|
    case info["age"]
    when 0..17
      info["age_group"] = "kid"
    when 18..64
      info["age_group"] = "adult"
    else
      info["age_group"] = "senior"
    end
  end
end

add_age_group(munsters)

p munsters
