class Games
    def gamble
        puts "How much would you like to gamble?"
        bet = gets.to_i
        @balance - bet
        @totalbet + bet
    end
end