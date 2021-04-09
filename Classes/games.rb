class Games
    def gamble
        puts 'Please Enter the amount you would like to gamble'
        gamble_valid = false
            until gamble_valid == true
            bet = gets.strip.to_i
                if bet == 0
                    puts "Please Enter a Valid Bet"
                else 
                    gamble_valid = true
                end
            end
        return bet
    end
    def game_menu
        game_menu = TTY::Prompt.new
        choice = game_menu.select("Please Select from the Following Options", ['Play' , 'Rules', 'Back'])
        case choice
        when "Play"
            game()
        when "Rules"
            rules()
        when "Back"
            input_loop(true, @name, @balance)
        end
    end
    def stats
        puts "Total Games Played: #{@tally}"
        puts "Total Money Gambled: #{@total_gambled}"
        puts "Total Games Won: #{@games_won}"
        puts "Total Games Lost: #{@games_lost}"
    end
end