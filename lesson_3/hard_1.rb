#
# Question 1
#
# I expect an error to be thrown about an undefined method or variable
# called greeting
#

if false
  greeting = “hello world”
end

greeting

# I was wrong! :)
#
# when you initialize a local variable within an if block, even if that if
# block doesn’t get executed, the local variable is initialized to nil.
#


#
# Question 2
#
# The result of the last line of the below code is:
# { :a => 'hi there' }
# because informal_greeting is a reference to greetings[:a] so modifies the hash
# value there


greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

#
# Question 3
#

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#
# above prints:
#
# one is: one
# two is: two
# three is: three
#
# no outer vars are changed by the method, they are all references, just
# resetting vars within the method
#

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#
# above prints:
#
# one is: one
# two is: two
# three is: three

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#
# above prints:
#
# one is: two
# two is: three
# three is: one
#
# gsub! mutates the caller
#

puts 'Question 4:'

#
# couple different ways:
#

def get_uuid_1
  chars_nums = [('a'..'z'), (1..10)].map { |i| i.to_a }.flatten
  uuid = (0..31).map { chars_nums[rand(chars_nums.length - 1)] }.join
  uuid.insert(8, '-')
  uuid.insert(13, '-')
  uuid.insert(18, '-')
  uuid.insert(23, '-')
end

def get_uuid_2
  uuid = [*('a'..'z'),*('0'..'9')].shuffle[0,32].join
  uuid.insert(8, '-')
  uuid.insert(13, '-')
  uuid.insert(18, '-')
  uuid.insert(23, '-')
end

#
# found this one on stack overflow, decided to try it:
#

def get_uuid_3
  require 'securerandom'
  uuid = SecureRandom.hex
  uuid.insert(8, '-')
  uuid.insert(13, '-')
  uuid.insert(18, '-')
  uuid.insert(23, '-')
end

puts get_uuid_1
puts get_uuid_2
puts get_uuid_3

#
# Question 5
#
# also added that each individual number section should not be longer than 3 digits
#
#

def is_a_number?(str)
  !!Integer(str)
rescue ArgumentError, TypeError
  false
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_a_number?(word) || word.size > 3
  end

  true
end

puts dot_separated_ip_address?('1.1.1.1') ? 'Yes' : 'No'

puts dot_separated_ip_address?('1.1.1') ? 'Yes' : 'No'

puts dot_separated_ip_address?('1.1.1.1.1') ? 'Yes' : 'No'

puts dot_separated_ip_address?('1.1.w.1') ? 'Yes' : 'No'

puts dot_separated_ip_address?('23.233.54.23') ? 'Yes' : 'No'

puts dot_separated_ip_address?('23.233.5444.23') ? 'Yes' : 'No'

