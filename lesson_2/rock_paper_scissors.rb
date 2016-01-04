VALID_CHOICES = {'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                 'l' => 'lizard', 'sp' => 'spock'}
score = {player: 0, computer: 0, tie: 0}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def tally_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  else
    score[:tie] += 1
  end
end

def display_score(score)
  prompt("You: #{score[:player]} | Computer: #{score[:computer]} | Ties: #{score[:tie]}")
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
   Kernel.puts("=> Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, (sp)ock")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.has_key?(choice)
      choice = VALID_CHOICES[choice]
      break
    else
      prompt("Valid inputs are: r, p, sc, l, sp")
    end
  end

  computer_choice = VALID_CHOICES[VALID_CHOICES.keys().sample()]

  prompt("You chose #{choice}; computer chose #{computer_choice}")

  display_result(choice, computer_choice)

  tally_score(choice, computer_choice, score)

  display_score(score)

  prompt("Do you want to play again? (y/n)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
