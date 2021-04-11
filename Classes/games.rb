require_relative 'errors'
class Games
    def gamble
        gamble_valid = false
        place_bet = TTY::Prompt.new
        until gamble_valid == true
            begin
                gamble = place_bet.ask("How much would you like to bet?:", convert: :float) do |q|
                q.convert(:float, "%{value} is not a valid bet, plese try again using only numbers")
            end
            raise EmptyField.new if gamble.class == NilClass
            raise InsufficientFunds.new if @balance - gamble < 0
            rescue EmptyField
                puts  "This is a required field, please enter a valid bet"
            rescue InsufficientFunds
                puts "You do not have enough money to pay back this bet if you lose, Balance = #{@balance}"
            else
                gamble_valid = true
            end
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
end