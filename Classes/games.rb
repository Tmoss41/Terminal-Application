class Games
    def gamble
        puts "How much would you ike to bet"
        bet = gets.to_i
        case bet
        when (@balance - bet) <= 0
            raise "Invalid Bet, Insufficient Funds"
        end
    end
end