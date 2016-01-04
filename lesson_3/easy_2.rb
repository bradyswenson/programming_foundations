puts 'Question 1:'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

p ages
puts 'Is spot included in the ages hash above?'
puts ages.include?('Spot') ? 'Yes' : 'No'
puts ages.key?('Spot') ? 'Yes' : 'No'
puts ages.member?('Spot') ? 'Yes' : 'No'


puts 'Question 2:'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }
total = 0
ages.each { | name, age| total += age }
puts total


puts 'Question 3:'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

ages.keep_if { | name, age | age < 100 }

p ages


puts 'Question 4:'

munsters_description = 'The Munsters are creepy in a good way.'

puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase


puts 'Question 5:'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10 }

additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }

ages.merge!(additional_ages)

p ages


puts 'Question 6:'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

puts ages.values.min


puts 'Question 7:'

advice = 'Few things in life are as important as house training your pet dinosaur.'

puts advice
puts 'Is the name "Dino" in the above string?'
puts advice.include?('Dino') ? 'No' : 'Yes'


puts 'Question 8:'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.find_index{ |name| name =~ /^Be/ }


puts 'Question 9:'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map!{ |name| name[0, 3] }

p flintstones


puts 'Question 10:'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map!{ |name| name[0, 3] }

p flintstones




