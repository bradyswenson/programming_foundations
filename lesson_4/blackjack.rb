def raw_deck
  (('2'..'10').to_a + ['A','K','Q','J']).map do |value|
    ['D','H','S','C'].map do |suit|
      [suit,value]
    end
  end
end

def new_deck
  raw_deck.flatten!(1).shuffle
end

def play_again?
  puts "Do you want to play again? ('y' to continue)"
  choice = gets.chomp
  choice.downcase == 'y'
end

def deal_card_to!(player_or_dealer, deck)
  player_or_dealer[:hand] << deck.pop
end

loop do
  deck = new_deck
  player = {hand: [], hand_total: 0}
  dealer = {hand: [], hand_total: 0}

  deal_card_to!(player, deck)
  deal_card_to!(dealer, deck)

  p player[:hand]
  p dealer[:hand]

  break unless play_again?
end
