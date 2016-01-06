puts 'Question 1:'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}


age_of_males = 0

munsters.each do |munster, info|
  if info["gender"] == "male"
    age_of_males += info["age"]
  end
end

puts age_of_males


puts 'Question 2:'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, info|
  puts "#{munster} is a #{info["age"]} year old #{info["gender"]}."
end


puts 'Question 3:'

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


puts 'Question 4:'

sentence = "Humpty Dumpty sat on a wall."

puts sentence.split.reverse.join(' ')


#
# Question 5
#
# 34 - answer is not changed because result of method call
# is assigned to new_answer
#
#

#
# Question 6
#
# yes, the method updated the munsters hash with the each method
#


#
# Question 7
#
# reduces to rps("paper", "rock") so result is "paper"
#

#
# Question 8
#
# "no"
#
# foo returns "yes" so bar("yes") evalutes to "no"
#





