require_relative "games"
# Enter how much you want to gamble
# Spin the wheel
# Get the result
# Return a value based on result
# Add gambled amount to balance
class Slots < Games
    attr_reader 
    @tally = 0
    def initialize(balance, name)
        @balance = balance
        @name = name
    end
    def rules
        puts "
        ██████╗░██╗░░░██╗██╗░░░░░███████╗░██████╗
        ██╔══██╗██║░░░██║██║░░░░░██╔════╝██╔════╝
        ██████╔╝██║░░░██║██║░░░░░█████╗░░╚█████╗░
        ██╔══██╗██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
        ██║░░██║╚██████╔╝███████╗███████╗██████╔╝
        ╚═╝░░╚═╝░╚═════╝░╚══════╝╚══════╝╚═════╝░"
        puts "To play Slots it is simple"
        puts "Enter how much you want to bet"
        puts "Spin the wheel"
        puts "See if you Win!"
        back = gets.chomp
            if back == "back"
               menu()
            end
    end
    def game()
        choice = TTY::Prompt.new
        reel = {jackpot: 2, breakeven: 1, loss: 0 }
        
        slots_playing = true
        while slots_playing == true and @balance > 0
            reel_size = choice.select("Select how many Reels", [3, 6 , 9])
            result = []
            case reel_size
            when 3
                3.times{result.push(reel.keys.sample)}
            when 6
                6.times{result.push(reel.keys.sample)}
            when 9
                9.times{result.push(reel.keys.sample)}
            end
            puts "How much would you like to bet"
            bet = gets.to_i
            score = []
            puts result
            puts "The Wheels spin and reveal...."
            result.each do |reel_result|
                score.push(reel[reel_result.to_sym])
            end
            puts score.sum
            if result.count(:jackpot) >= reel_size/2
            puts "Minor Jackpot"
            @balance = (0.5 * bet).to_i + @balance
        elsif result.count(:jackpot) == reel_size
            puts "
            ███████╗ ███████╗ ███████╗
            ╚════██║ ╚════██║ ╚════██║
            ░░░░██╔╝ ░░░░██╔╝ ░░░░██╔╝
            ░░░██╔╝░ ░░░██╔╝░ ░░░██╔╝░
            ░░██╔╝░░ ░░██╔╝░░ ░░██╔╝░░
            ░░╚═╝░░░ ░░╚═╝░░░ ░░╚═╝░░░".colorize(:yellow)
            puts "Ding Ding Ding, Jackpot"
            @balance = (3 * bet)+ @balance
        elsif result.count(:breakeven) >= reel_size/2
            puts "Nothing loss, nothing gained, Broke Even"
        else result.count(:loss) >= reel_size/2
            puts "You Lose"
            
            puts "
             _____    _____     _____

           | () () || () () | | () () |
             |||||    |||||     |||||
             |||||    |||||     |||||".colorize(:yellow)
            @balance = @balance - bet
        end
        puts "Your balance is now #{@balance}"
        slots_playing = choice.select("Do you want to play again?" , ["Yes", "No"])
        case slots_playing
        when "Yes"
            slots_playing = true
        when "No"
            slots_playing = false
        end
        end
        puts "Returning to Game Menu"
        game_menu()
    end
end