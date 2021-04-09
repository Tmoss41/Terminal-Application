
class Games
    def gamble
        place_bet = TTY::Prompt.new
        gamble = place_bet.ask("How much would you like to bet?:", convert: :float) do |q|
            q.convert(:float, "%{value} is not a valid bet, plese try again using only numbers")
        end
        return gamble
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