
class Games
    def gamble
        place_bet = TTY::Prompt.new
        gamble = place_bet.ask("How much would you like to bet?:", convert: :float) do |q|
            q.convert(:float, "%{value} is not a valid bet, plese try again using only numbers")
            # if q.class == nil
            #     rescu
        end
        return gamble
    end
    def game_menu
        in_game_menu = true
        game_menu = TTY::Prompt.new
        until !game_menu
            choice = game_menu.select("Please Select from the Following Options", ['Play' , 'Rules', 'Back'])
            case choice
            when "Play"
                playing_game = true
                until !playing_game
                    game()
                    playing_game = false
                end
            when "Rules"
                rules()
            when "Back"
                return
            end
        end
    end
    def stats
        puts "Total Games Played: #{@tally}"
        puts "Total Money Gambled: #{@total_gambled}"
        puts "Total Games Won: #{@games_won}"
        puts "Total Games Lost: #{@games_lost}"
    end
end