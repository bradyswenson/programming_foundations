POINT_TARGET = 21
DEALER_STAY = 17
SERIES_TARGET = 3
player = { hand: [], wins: 0 }
dealer = { hand: [], wins: 0 }

def raw_deck
  (('2'..'10').to_a + ['Ace', 'King', 'Queen', 'Jack']) * 4
end

def new_deck
  raw_deck.shuffle
end

def play_again?
  puts "\nDo you want to play again? ('y' to continue)"
  choice = gets.chomp
  choice.downcase == 'y'
end

def deal_card!(hand, deck)
  hand << deck.shift
end

def display_cards(player, dealer, turn)
  system 'clear'

  if turn == :player
    puts "Dealer has < #{dealer[:hand].first}, ?? >."
  elsif turn == :dealer
    dealer_hand = dealer[:hand].join(', ')
    dealer_hand_total = hand_total(dealer[:hand])
    puts "Dealer has < #{dealer_hand} > for #{dealer_hand_total} points."
  end

  player_hand = player[:hand].join(', ')
  player_hand_total = hand_total(player[:hand])
  puts "You have < #{player_hand} > for #{player_hand_total} points."
end

def hand_total(hand)
  hand_total = 0

  hand.each do |card|
    hand_total += 11 if card == 'Ace'
    hand_total += 10 if %w(King Queen Jack).include?(card)
    hand_total += card.to_i if card.to_i.between?(2, 10)
  end
  hand.count('Ace').times do
    hand_total -= 10 if hand_total > POINT_TARGET
  end

  hand_total
end

def bust?(hand)
  hand_total(hand) > POINT_TARGET
end

def win?(hand_one, hand_two)
  (hand_total(hand_one) > hand_total(hand_two)) && !bust?(hand_one)
end

def push?(hand_one, hand_two)
  hand_total(hand_one) == hand_total(hand_two)
end

def do_player_turn!(player, dealer, deck)
  player_choice = ''
  loop do
    puts "\nWhat do you want to do? (s)tay or (h)it"
    player_choice = gets.chomp.downcase
    deal_card!(player[:hand], deck) if player_choice == 'h'
    display_cards(player, dealer, :player) if player_choice == 'h'
    break if player_choice == 's' || bust?(player[:hand])
  end
end

def do_dealer_turn!(dealer, deck)
  if hand_total(dealer[:hand]) <= DEALER_STAY
    loop do
      deal_card!(dealer[:hand], deck)
      break if hand_total(dealer[:hand]) >= DEALER_STAY
    end
  end
end

def display_result(player, dealer)
  puts case
       when bust?(player[:hand]) then "\nYou busted!"
       when bust?(dealer[:hand]) then "\nDealer busted. You win!"
       when win?(player[:hand], dealer[:hand]) then "\nYou win!"
       when win?(dealer[:hand], player[:hand]) then "\nYou lose."
       when push?(dealer[:hand], player[:hand]) then "\nPush."
       end

  puts "\nPlayer: #{player[:wins]} | Dealer: #{dealer[:wins]}"
  puts case
       when player[:wins] == 5 then "\nYou win the series!"
       when dealer[:wins] == 5 then "\nBetter luck next time."
       end
end

def update_win_count(player, dealer)
  if dealer[:wins] == SERIES_TARGET || player[:wins] == SERIES_TARGET
    player[:wins] = 0
    dealer[:wins] = 0
  end

  player[:wins] += 1 if bust?(dealer[:hand]) || win?(player[:hand], dealer[:hand])
  dealer[:wins] += 1 if bust?(player[:hand]) || win?(dealer[:hand], player[:hand])
end

loop do
  player[:hand] = []
  dealer[:hand] = []
  deck = new_deck

  2.times do
    deal_card!(player[:hand], deck)
    deal_card!(dealer[:hand], deck)
  end

  display_cards(player, dealer, :player)
  do_player_turn!(player, dealer, deck)

  do_dealer_turn!(dealer, deck) unless bust?(player[:hand])
  display_cards(player, dealer, :dealer)

  update_win_count(player, dealer)
  display_result(player, dealer)
  break unless play_again?
end
