=begin
Question 1:
numbers.uniq returns a new array, .uniq!, however, mutates the caller

=end

=begin
Question 2:
in ruby the ! is used at the end of some methods to indicate that the caller will be mutated, ? is used at the end of some methods to indicate that a question is answered by the method
1 - != is not equal and should be used for evaluation in conditionals
2 - you can put ! before a variable to say "not" for instance !true
3 - ! is used at the end of a method to indicate that it mutates the caller
4 - ? is used as the ternery operator, i.e. puts "something" ? true : false
5 - ? is used at the end of some methods (called predicates) to indicate that the method answers the question described by the method name
6 - !! or double bang or not not, it's a double negative, used to return an explicitly boolean value
7 -

=end

puts "Question 3:"

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

puts advice


=begin
Question 4

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)

.delete_at deletes at index 1, or the number '2' in the array [1, 3, 4, 5]
.delete deletes all '1's from the array [2, 3, 4, 5]

=end

puts "Question 5:"

puts "Yes" if (10..100).include?(42)


puts "Question 6:"

famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

=begin
Question 7

add_eight(add_eight(add_eight(add_eight(add_eight(number)))))

10+8+8+8+8 = 42

=end

puts "Question 8:"

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

p flintstones


puts "Question 9:"

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }
flintstones.select!{|k,v| k == "Barney"}
flintstones = flintstones.to_a.flatten
p flintstones

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintsones_hash = {}
flintstones.each_with_index do |name, index|
  flintsones_hash[index] = name
end
p flintsones_hash








