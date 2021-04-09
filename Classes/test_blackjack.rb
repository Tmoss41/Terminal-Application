hand = [20, 1]
house = 14
bust = false
house_bust = house > 21
blackjack = hand.sum == 21
high_number = hand.sum > house 
win =  (high_number || blackjack || house_bust) and bust == false

p win
puts blackjack
puts high_number
puts house_bust